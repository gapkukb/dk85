import { get, post } from './_http'

/** 收藏游戏 */
export const queryCaptcha = get('/captcha', {
    responseType: 'blob',
    silent: true,
    predicate(resp) {
        return resp.status === 200
    },
    normalizer: { enable: false },
})
