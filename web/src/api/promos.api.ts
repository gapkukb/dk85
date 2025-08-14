import { get, post } from './http'

/** 每日签到列表 */
export const queryDailyBouns = get<model.promo.DailyBounsRecord[]>('/get-sign')
export const doDailyBouns = post('/user-sign')
