import { get, post } from './_http'
import { refreshOption } from './_interceptor'
export const register = post('/register', { loading: true })
export const login = post('/login', { loading: true })
export const refreshToken = get('/refresh-token', { ...refreshOption })
export const queryBalance = get<model.user.Balance>('/refresh-balance', { protected: true })
export const updatePassword = post('/change-login-password', { protected: true })
export const queryUserInfo = get<model.user.User>('/user-info')