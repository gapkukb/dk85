import axios, { isAxiosError } from 'axios'
import { type Http } from '@/http'
import type { AxiosResponse, InternalAxiosRequestConfig } from 'axios'
import { modals } from '@/modals'
import TokenManager from '@/shared/token-manager'
import { useUser } from '@/stores/user.store'
import { i18n } from '@/locales'

let promise: Promise<any> | null = null

export default function customize() {
    return function biz(http: Http) {
        let cfg: AxiosResponse['config']

        http.inst.interceptors.request.use(async function (config) {
            let token = TokenManager.accessToken.value
            config.headers.set('accept-language', i18n.global.locale)

            if (config.protected && !token) throw '接口非法调用'
            if (promise) {
                // 将新进来的请求堵住
                await promise
            }
            if (token) {
                config.headers.setAuthorization(token)
            }
            return config
        })

        // 处理鉴权失败
        http.inst.interceptors.response.use(async function (response) {
            let token = TokenManager.accessToken.value
            try {
                const user = useUser()
                // 非鉴权失败错误直接放行,交由后面的拦截器处理
                if (response.status !== 401 && response.data.code !== 666) return response

                cfg = response.config

                function reload() {
                    cfg.headers.setAuthorization(token)
                    return axios.request(cfg)
                }

                // 请求由于网络原因，失败的请求可能比refresh接口请求回来的慢，导致重复登录失效
                // 因此后面回来的请求的token和最新的token如果不一致，直接用新token再请求一次
                if (cfg.headers.Authorization !== token) return reload()

                console.log(12313)

                if (!promise) {
                    promise = refreshToken(response.config)
                        .then((rs) => {
                            TokenManager.set(rs.token)
                            token = rs.token
                            return rs
                        })
                        .catch((err) => {
                            user.clearUser()
                            modals.authentication.open()
                            return Promise.reject(err)
                        })
                        .finally(() => (promise = null))
                }
                await promise
                // 已经失败的请求等待刷新token完成后，更新token参数，再次调用
                return reload()
            } catch (error) {
                console.log(error)
                throw error
            }
        })
    }
}

function refreshToken(config: InternalAxiosRequestConfig) {
    return axios
        .request({
            ...config,
            url: '/refresh-token',
        })
        .then((rs) => {
            if (rs.data.code === 200) return rs.data.data
            return Promise.reject(rs)
        })
}

declare module 'axios' {
    interface AxiosRequestConfig {
        protected?: boolean
    }
}
