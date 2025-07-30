import { get, post, put, del } from './_http'

/** 查询所有银行卡 */
export const queryBanks = get('/banks')
export const asyncAddBank = post('/banks/add')
export const asyncUpdateBank = put('/banks/update')
export const asyncDeleteBank = del('/banks/delete')
