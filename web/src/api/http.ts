import { Http } from '@/http'
import { normalizePlugin, errorPlugin, loadingPlugin } from '@/http'
import type { AxiosError, AxiosResponse } from 'axios'
import { showLoadingToast, showToast, type ToastWrapperInstance } from 'vant'
import customize from './_customize'

export const http = new Http({ baseURL: '/app' })
export const get = http.get
export const post = http.post
export const put = http.put
export const del = http.del

// const http = new Http({ baseURL: '/api' })
let ins: ToastWrapperInstance
http.use(customize())
http.use(
    errorPlugin({
        predicate(result: AxiosError | AxiosResponse) {
            if (result.data?.code === 666) return t('app.requridAuth')
            //@ts-ignore
            return result.data?.message || result.message
        },
        show(msg) {
            showToast(msg)
        },
    })
)
http.use(normalizePlugin({}))
http.use(
    loadingPlugin({
        default: false,
        show(loading) {
            if (loading) {
                ins = showLoadingToast({
                    duration: 0,
                    overlay: true,
                    message: t('app.waiting'),
                })
            } else {
                ins.close()
            }
        },
    })
)
