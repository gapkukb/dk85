import { useUser } from '@/stores/user.store'
import loginViaAccount from './loginViaAccount'
import loginViaOauth from './loginViaOauth'
import loginViaTicket from './loginViaTicket'
import TokenManager from '@/shared/token-manager'

export enum LoginType {
    Account,
    OAuth,
    OTP,
    Ticket,
}

function _login(payload: any, type?: LoginType) {
    if (type === LoginType.OAuth) return loginViaOauth(payload)
    if (type === LoginType.OTP) return loginViaOauth(payload)
    if (type === LoginType.Ticket) return loginViaTicket(payload)
    return loginViaAccount(payload)
}

export default async function login(payload: any, type?: LoginType): Promise<model.user.vo.Login> {
    const user = useUser()
    const vo = await _login(payload, type)
    TokenManager.set(vo.token)
    await user.updateUser()
    return vo
}

export { login }
