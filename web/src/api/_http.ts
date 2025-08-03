import { Http, normalizePlugin, errorPlugin, loadingPlugin } from '@/http'
import type { AxiosError, AxiosResponse } from 'axios'
import { showLoadingToast, showToast } from 'vant'
import type { ToastWrapperInstance } from 'vant/es'
import { interceptor } from './_interceptor'

const http = new Http({ baseURL: '/app' })
// const http = new Http({ baseURL: '/api' })
let ins: ToastWrapperInstance

http.use(interceptor())
http.use(
    errorPlugin({
        predicate(result: AxiosError | AxiosResponse) {
            if(result.data?.code === 666) return "请登录"
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

export const get = http.get.bind(http)
export const post = http.post.bind(http)
export const put = http.put.bind(http)
export const del = http.delete.bind(http)

// export const front = glaxy.copyWith({ baseURL: '/_front_api_' })
