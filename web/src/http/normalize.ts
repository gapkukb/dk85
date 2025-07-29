import type { AxiosResponse } from 'axios'
import type Http from './Http'

export interface NormalizeOption {
    enable?: boolean
    debug?: boolean
    normalizePayload?: NormalizeRequest
    normalizeResponse?: NormalizeRequest
}

export type NormalizeRequest = (value: any) => boolean
export type NormalizeResponse = (response: AxiosResponse) => boolean

declare module 'axios' {
    interface AxiosRequestConfig {
        normalizer?: NormalizeOption
    }
}

export default function normalizePlugin(option: NormalizeOption) {
    function defaultNormalizePayload(value: any) {
        if (value === 0 || value === false) return true
        if (typeof value === 'string') value = value.trim()
        if (!value) return false
        if (typeof value === 'object') {
            if (Object.keys(value).length === 0) return false
            return true
        }
        return true
    }

    function filter(validate: NormalizeRequest, debug: boolean, url: string, payload?: Record<string | number, any>) {
        if (!payload) return payload
        let value: any

        for (const key of Object.keys(payload)) {
            value = payload[key]

            if (!validate(value)) {
                debug && console.warn(`${key}:${value}  will be delete cause by empty value with url:{${url}}`)
                delete payload[key]
            }
        }

        return payload
    }

    function defaultNormalizeResponse(resp: AxiosResponse) {
        if (resp.data?.code === 200) return resp.data.data
        return resp.data
    }

    const { enable = true, debug = false, normalizePayload = defaultNormalizePayload, normalizeResponse = defaultNormalizeResponse } = option || {}

    return function normalize(http: Http) {
        http.inst.interceptors.request.use(function (config) {
            const _enable = config.normalizer?.enable ?? enable

            if (_enable) return config

            const $validate = config.normalizer?.normalizePayload || normalizePayload
            const $filter = (o: any) => filter($validate, debug, config.url!, o)

            config.data = $filter(config.data)
            config.params = $filter(config.params)

            return config
        })

        http.inst.interceptors.response.use(function response(resp) {
            const _enable = resp.config.normalizer?.enable ?? enable
            if (!_enable) return resp

            const normalize = resp.config.normalizer?.normalizeResponse || normalizeResponse

            return normalize(resp)
        })
    }
}
