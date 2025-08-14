import { modals } from '@/modals'
import TokenManager from '@/shared/token-manager'
import { useUser } from '@/stores/user.store'
import { showSuccessToast, showToast } from 'vant'

export function useAccountAction(action: any, message: string) {
    const user = useUser()
    const timestamp = ref()
    const key = ref(1)
    const router = useRouter()

    async function handler(form: any) {
        form.time = timestamp.value
        return action(form)
            .then(async (rs: any) => {
                TokenManager.set(rs.token)
                await user.updateUser()
                showSuccessToast(message)
                router.replace('/')
                modals.authentication.open()
            })
            .catch(() => {
                key.value++
                return Promise.reject()
            })
    }

    return { key, timestamp, handler }
}
