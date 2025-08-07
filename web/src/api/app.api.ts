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
export const queryNotices =  get<model.app.Notice[]>('/notice-list')
//首页弹窗图
export const queryAds =  get<model.app.Adversite[]>('/ad-list')
