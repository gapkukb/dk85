import type { AxiosError, AxiosRequestConfig, AxiosResponse } from 'axios'
import type Http from './Http'
import type { Functionable } from './types'
import { tryExcute } from './helper'

export interface ErrorPluginOption {
    predicate: (error: AxiosError | AxiosResponse) => string | undefined
    show(msg: string): void
}

declare module 'axios' {
    interface AxiosRequestConfig {
        silent?: boolean
    }
}

export default function errorPlugin(option: ErrorPluginOption) {
    return function error(http: Http) {
        http.inst.interceptors.response.use(function succeed(response) {
            if (response.config.silent || response.data.code === 200) {
                return response
            }
            throw response
        })
        http.inst.interceptors.response.use(undefined, function fail(error: AxiosError | AxiosResponse) {
            if (error.config?.silent) return error
            const value = option.predicate(error)
            value && option.show(value)
            return Promise.reject(error)
        })
    }
}
