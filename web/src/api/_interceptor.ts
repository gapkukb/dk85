import type { Http } from '@/http'
import { useUser } from '@/stores/user.store'
import type { AxiosRequestConfig } from 'axios'
import { refresh } from './user.api'
import { Modals, ModalsName } from '@/modals'

const prop = '__refresh__'
let promise: Promise<any> | null = null

function isRefresh(config: AxiosRequestConfig) {
    return prop in config
}

export const refreshOption = { [prop]: true }

export function interceptor() {
    return function biz(http: Http) {
        let user: ReturnType<typeof useUser>
        http.inst.interceptors.request.use(async function (config) {
            user ||= useUser()
            if (config.protected && !user.authenticated) throw '接口非法调用'
            if (promise && !isRefresh(config)) {
                // 将新进来的请求堵住
                await promise
            }
            if (user.token) {
                config.headers.setAuthorization(user.token)
            }
            return config
        })
        http.inst.interceptors.response.use(async function (response) {
            // 登录过期
            if (response.data.code === 666) {
                if (isRefresh(response.config)) {
                    // 如果连刷新token的接口都过期了，那么就需要重新走登录流程
                    Modals.open(ModalsName.login)
                    
                    return response
                }

                // 将已经失败的请求等待刷新接口完成后，再次调用
                if (promise) await promise

                promise = refresh({ token: user.refreshToken })
                promise.then((rs) => {
                    user.setUser(rs)
                })
                promise.finally(() => (promise = null))
                await promise
                return response.request(response.config)
            }
            return response
        })
    }
}

declare module 'axios' {
    interface AxiosRequestConfig {
        protected?: boolean
    }
}
