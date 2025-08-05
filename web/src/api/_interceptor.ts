import type { Http } from '@/http'
import { useUser } from '@/stores/user.store'
import type { AxiosError, AxiosRequestConfig, AxiosResponse } from 'axios'
import { refreshToken } from './user.api'
import { modals } from '@/modals'
import axios, { isAxiosError } from 'axios'

const prop = '__refresh__'
let promise: Promise<any> | null = null

function _isRefresh(config: AxiosRequestConfig) {
    return prop in config
}

export const refreshOption = { [prop]: true }

export function interceptor() {
    return function biz(http: Http) {
        let cfg: AxiosResponse['config']
        let user: ReturnType<typeof useUser>

        http.inst.interceptors.request.use(async function (config) {
            user ||= useUser()
            if (config.protected && !user.authenticated) throw '接口非法调用'
            if (promise && !_isRefresh(config)) {
                // 将新进来的请求堵住
                await promise
            }
            if (user.token) {
                config.headers.setAuthorization(user.token)
            }
            return config
        })

        // 处理鉴权失败
        http.inst.interceptors.response.use(async function (response) {
            // 非鉴权失败错误直接放行,交由后面的拦截器处理
            if (response.data.code !== 666) return response

            cfg = response.config
            // 没有登录直接放行，交由后面的拦截器处理
            // 如果连刷新token的接口都过期了直接放行，唤起登录
            if (!user.authenticated || _isRefresh(cfg)) {
                user.clearUser()
                modals.authentication.open()
                return response
            }

            function reload() {
                cfg.headers.setAuthorization(user.token)
                return axios.request(cfg)
            }

            // 请求由于网络原因，失败的请求可能比refresh接口请求回来的慢，导致重复登录失效
            // 因此后面回来的请求的token和最新的token如果不一致，直接用新token再请求一次
            if (cfg.headers.Authorization !== user.token) return reload()

            if (!promise) {
                promise = refreshToken()
                    .then((rs) => user.updateToken(rs.token))
                    // .catch((err) => {
                    //     user.clearUser()
                    //     Modals.open(ModalsName.login)
                    //     return Promise.reject(err)
                    // })
                    .finally(() => (promise = null))
            }
            await promise
            // 已经失败的请求等待刷新token完成后，更新token参数，再次调用
            return reload()
        })
    }
}

declare module 'axios' {
    interface AxiosRequestConfig {
        protected?: boolean
    }
}
