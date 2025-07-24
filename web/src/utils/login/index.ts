import loginViaAccount from './LoginViaAccount'
import loginViaOauth from './LoginViaOAuth'
import loginViaTicket from './LoginViaTicket'

export enum LoginType {
    Account,
    OAuth,
    OTP,
    Ticket,
}

export default function login(type: LoginType, payload: any): Promise<model.user.vo.Login> {
    if (type === LoginType.OAuth) return loginViaOauth(payload)
    if (type === LoginType.OTP) return loginViaOauth(payload)
    if (type === LoginType.Ticket) return loginViaTicket(payload)
    return loginViaAccount(payload)
}

export {login}