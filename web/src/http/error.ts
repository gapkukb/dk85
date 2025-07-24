import type { AxiosError, AxiosResponse } from 'axios'
import type Http from './Http'
import type { Functionable } from './types'
import { tryExcute } from './helper'

export interface ErrorPluginOption {
    enable?: Functionable<boolean>
    silent?: boolean
    handlers?: Functionable<Record<string | number, Functionable<string>>> | { default: (error: AxiosError) => string | undefined }
    handle?(msg: string): void
}

declare module 'axios' {
    interface AxiosRequestConfig {
        silent?: boolean
    }
}

export default function errorPlugin(option: ErrorPluginOption = {}) {
    const { enable = true, silent = false, handlers, handle: show } = option
    const _enable = enable && !!handlers
    const _handlers = tryExcute(handlers)!

    return function error(http: Http) {
        http.inst.interceptors.response.use(function succeed(response) {
            if (response.data.code === 200) {
                return response
            }
            throw response
        })
        http.inst.interceptors.response.use(undefined, function fail(error: AxiosError | AxiosResponse) {
            const _silent = error.config!.silent ?? silent
            if (_enable && !_silent) {
                const value = tryExcute(_handlers[error.status!], error.config!) || _handlers.default?.(error)
                if (value && show) show(value)
            }
            throw error
        })
    }
}
