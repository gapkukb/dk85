import { login } from '@/api'

export default function loginViaAccount(paylaod: any): Promise<model.user.vo.Login> {
    return login(paylaod)
}
