import { modals } from '@/modals'
import { useUser } from '@/stores/user.store'

export default function useIsNotAuthenticated() {
    const auth = useUser().authenticated
    if (auth) return false
    modals.authentication.open()
    return true
}
