import { get, post, http } from './http'

const fundsApi = http.copyWith({ baseURL: '/payment' })
/** 查询所有银行卡 */
export const queryPaymentList = get<Record<string, model.funds.PaymentProvider>>('/payment-list')
/** 提现渠道列表 */
export const queryWithdrawalChannels = get<model.funds.Channel[]>('/withdraw-channel-list')
/** 用户提现(新) */
export const withdraw = post<model.funds.Channel[]>('/withdraw-new')

/** 存款 */
export const deposit = fundsApi.post('/order', { loading: true })
/** 查询存款渠道 */
export const asyncConfirmDeposit = fundsApi.post('/match', { loading: true })
