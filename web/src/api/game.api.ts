import { get, post } from './_http'

/** 收藏游戏 */
export const favoriteGame = post('/favorite')
/** 取消收藏游戏 */
export const unfavoriteGame = post('/unfavorite')
/** 获取游戏地址 */
export const queryGameUrl = get('/query-game-url')
/** 热门游戏 */
export const queryHotGames = post('/hot')
