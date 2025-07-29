import { get, post } from './_http'
import { refreshOption } from './_interceptor'
export const register = post('/register', { loading: true })
export const login = post('/login', { loading: true, protected: true })
export const refresh = post('/login', { ...refreshOption })
