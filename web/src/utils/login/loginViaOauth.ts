import { login } from '@/api'

export default function loginViaOauth(paylaod: any): Promise<model.user.vo.Login> {
    return login(paylaod)
}
