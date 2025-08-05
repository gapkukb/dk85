import { get, post, put, del, payment } from './_http'

/** 查询所有银行卡 */
export const queryPaymentList = get<Record<string, model.funds.PaymentProvider>>('/payment-list')
export const asyncDeposit = payment.post('/order', { loading: true })
export const asyncConfirmDeposit = payment.post('/match', { loading: true })
export const asyncAddBank = post('/banks/add')
export const asyncUpdateBank = put('/banks/update')
export const asyncDeleteBank = del('/banks/delete')
