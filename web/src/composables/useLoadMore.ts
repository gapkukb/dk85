import { vIntersectionObserver } from '@vueuse/components'

export default function useLoadMore(callback: Function) {
    const loading = shallowRef(false)
    const done = shallowRef(false)

    async function loadMore([entry]: IntersectionObserverEntry[]) {
        await Promise.delay(100)
        if (!entry.isIntersecting) return
        if (loading.value || done.value) return
        loading.value = true
        try {
            await callback()
        } finally {
            loading.value = false
        }
    }
    return { loading, done, loadMore, vIntersect: vIntersectionObserver }
}
