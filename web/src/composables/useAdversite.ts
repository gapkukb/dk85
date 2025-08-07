import { queryAds } from '@/api'
import openUrl from '@/helper/open-url'
import { router } from '@/router'
import { useQuery } from '@tanstack/vue-query'

export function useAdversite(type: number, position: number) {
    const { data } = useQuery({
        queryKey: ['adversite'],
        queryFn: () => queryAds(),
        shallow: true,
        placeholderData: [],
    })

    function navigate(url?: string) {
        if (!url) return
        if (url.startsWith('http')) {
            openUrl(url)
        } else {
            router.push(url)
        }
    }

    const result = computed(() => (data.value || []).filter((i) => i.type === type && i.position === position))

    return { result, navigate }
}
