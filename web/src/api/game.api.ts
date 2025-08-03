import { get, post } from './_http'

/** 收藏游戏 */
export const favoriteGame = post('/favorite')
/** 取消收藏游戏 */
export const unfavoriteGame = post('/unfavorite')
/** 获取游戏地址 */
export const queryGameUrl = post('/redirect-to-game')
/** 查询所有游戏 */
export const queryAllGame = get('/get-game-list')
/** 热门游戏 */
export const queryHotGames = post('/hot')
