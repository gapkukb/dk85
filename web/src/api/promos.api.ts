import { get, post } from './_http'

/** 查询优惠活动列表 */
export const queryActivities = get('/activities')
export const queryClainmedList = get('/clainmed/list')
