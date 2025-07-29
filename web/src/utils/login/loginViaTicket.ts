import { login } from "@/api/user.api";

export default function loginViaTicket(paylaod: any): Promise<model.user.vo.Login> {
    return login(paylaod)
}
