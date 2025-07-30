import { type InternalAxiosRequestConfig, getAdapter } from 'axios'
import type Http from './Http'

export interface LoadingOption {
    default?: boolean
    show: (loading: boolean) => void
}

declare module 'axios' {
    interface AxiosRequestConfig {
        loading?: boolean
    }
}

export default function loadingPlugin(option: LoadingOption) {
    const { default: enabled = true, show } = option
    let n = 0
    return function loading(http: Http) {
        const adapter = getAdapter(http.inst.defaults.adapter)

        http.inst.defaults.adapter = function (config: InternalAxiosRequestConfig) {
            const _loading = config.loading ?? (config.silent === void 0 ? enabled : !config.silent)
            if (_loading && n++ === 0) {
                show(true)
            }

            function close() {
                if (_loading && --n === 0) {
                    show(false)
                }
            }

            return adapter(config).finally(close)
        }
    }
}
