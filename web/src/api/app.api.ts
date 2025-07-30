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

export const testProtected = get('/protected')
export const testRefresh = post('/refresh')
