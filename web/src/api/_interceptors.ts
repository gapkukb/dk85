import { http } from './_http'
import { normalizePlugin, errorPlugin, loadingPlugin, refreshToken } from '@/http'
import type { AxiosError, AxiosResponse } from 'axios'
import { showLoadingToast, showToast, type ToastWrapperInstance } from 'vant'
import customize from './_customize'

// const http = new Http({ baseURL: '/api' })
let ins: ToastWrapperInstance
http.use(customize())
http.use(
    errorPlugin({
        predicate(result: AxiosError | AxiosResponse) {
            if (result.data?.code === 666) return '请登录'
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
