import { Http, normalizePlugin, errorPlugin } from '@/http'
import type { AxiosError } from 'axios'
import { showToast } from 'vant'

const http = new Http({ baseURL: '/api' })

http.use(
    errorPlugin({
        handlers: {
            default(error: AxiosError) {
                return error.data?.msg || error.message
            },
        },
        handle(msg) {
            showToast(msg)
        },
    })
)
http.use(normalizePlugin({}))

export const get = http.get.bind(http)
export const post = http.post.bind(http)
export const put = http.put.bind(http)
export const del = http.delete.bind(http)

// export const front = glaxy.copyWith({ baseURL: '/_front_api_' })
