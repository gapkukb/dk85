import { queryBalance } from '@/api'
import { useUser } from '@/stores/user.store'
import { formatter } from '@/utils/number'

const balance = ref(0)
const loading = ref(false)

async function refresh() {
    const user = useUser()
    if (!user.authenticated || loading.value) return
    loading.value = true
    return Promise.all([queryBalance(), Promise.delay(300)])
        .then(([n]) => {
            balance.value = n.balance
            return n
        })
        .finally(() => {
            loading.value = false
        })
}

export default function useBalance() {
    refresh()
    const formattedBalance = computed(() => formatter.commatize(balance.value, 2))
    return { balance, refresh, loading, formattedBalance }
}
