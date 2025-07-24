import { login } from '@/api'

export default function loginViaOtp(paylaod: any): Promise<model.user.vo.Login> {
    return login(paylaod)
}
