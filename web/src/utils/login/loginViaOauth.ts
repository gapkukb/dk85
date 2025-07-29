import { login } from "@/api/user.api";

export default function loginViaOauth(paylaod: any): Promise<model.user.vo.Login> {
    return login(paylaod)
}
