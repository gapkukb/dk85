import { get, post } from './_http'

/** 收藏游戏 */
export const queryCaptcha = get('/captcha', {
    responseType: 'blob',
    silent: true,
    predicate(resp: any) {
        return resp.status === 200
    },
    normalizer: { enable: false },
})

export const queryAppInfo =  get<model.app.AppInfo>('/basic-setting')
