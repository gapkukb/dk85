import { login } from '@/api'

export default function loginViaTicket(paylaod: any): Promise<model.user.vo.Login> {
    return login(paylaod)
}
