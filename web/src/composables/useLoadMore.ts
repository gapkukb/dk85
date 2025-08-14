import { throttle, debounce } from 'lodash-es'
import { vIntersectionObserver } from '@vueuse/components'
import type { ComputedGetter } from 'vue'

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

export function usePagination<T extends any>(getter: any, size = 21) {
    const rawList = computed<T[]>(() => getter.value || [])
    const current = ref(0)
    const hasMore = computed(() => current.value * size < rawList.value.length)
    const showList = computed<T[]>(() => rawList.value.slice(0, current.value * size))

    const add = throttle(function add([entry]: IntersectionObserverEntry[]) {
        if (!hasMore.value) return
        current.value++
    }, 300)

    return { vIntersect: vIntersectionObserver, showList, hasMore, add }
}
