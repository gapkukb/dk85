import { useUser } from '@/stores/user.store'
import loginViaAccount from './loginViaAccount'
import loginViaOauth from './loginViaOauth'
import loginViaTicket from './loginViaTicket'

export enum LoginType {
    Account,
    OAuth,
    OTP,
    Ticket,
}

function success(payload: any, type?: LoginType) {
    if (type === LoginType.OAuth) return loginViaOauth(payload)
    if (type === LoginType.OTP) return loginViaOauth(payload)
    if (type === LoginType.Ticket) return loginViaTicket(payload)
    return loginViaAccount(payload)
}

export default function login(payload: any, type?: LoginType): Promise<model.user.vo.Login> {
    const user = useUser()
    return success(payload, type).then((vo) => {
        user.setUser(vo)
        return vo
    })
}

export { login }
