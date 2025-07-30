import { get, post } from './_http'

export const queryOtp = post('/otp')

export const queryCheckin = get('/check-in')
export const doCheckIn = post('/check-in')
