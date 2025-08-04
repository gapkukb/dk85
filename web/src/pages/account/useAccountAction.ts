import { Modals, ModalsName } from '@/modals'
import { useUser } from '@/stores/user.store'
import { showSuccessToast, showToast } from 'vant'

export function useAccountAction(action: any,message:string) {
    const user = useUser()
    const timestamp = ref()
    const key = ref(1)
    const router = useRouter()

    async function handler(form: any) {
        form.time = timestamp.value
        return action(form)
            .then(async (rs: any) => {
                user.updateToken(rs.token)
                await user.updateUser()
                showSuccessToast(message)
                router.replace('/')
                Modals.close(ModalsName.login)
            })
            .catch(() => {
                key.value++
                return Promise.reject()
            })
    }

    return { key, timestamp, handler }
}
