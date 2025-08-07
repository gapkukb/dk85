import { Http } from '@/http'


export const http = new Http({ baseURL: '/app' })

export const get = http.get.bind(http)
export const post = http.post.bind(http)
export const put = http.put.bind(http)
export const del = http.delete.bind(http)

export const payment = http.copyWith({ baseURL: '/payment' })
