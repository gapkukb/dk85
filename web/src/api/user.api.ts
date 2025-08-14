import { get, post } from './http'

export const register = post('/register', { loading: true })
export const login = post('/login', { loading: true })
export const queryBalance = get<model.user.Balance>('/refresh-balance', { protected: true })
export const updatePassword = post('/change-login-password', { protected: true })
export const queryUserInfo = get<model.user.User>('/user-info')

export const bindMobileNumber = post('/bind-mobile', { protected: true, loading: true })
export const bindEmail = post('/bind-email', { protected: true, loading: true })
