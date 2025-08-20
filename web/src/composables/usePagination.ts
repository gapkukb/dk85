import { throttle } from "lodash-es";

export function usePagination2<T>({ page: init = 0, size = 50, loader }: { page?: number; size?: number; loader: (page: number, size: number) => Promise<T> }) {
    const page = ref(init)
    const finished = ref(false)
    const list = ref<model.game.Record[]>([])
    const loading = ref(false)
    const load = throttle(async function load() {
        page.value++
        // await Promise.delay(3000)
        const rs = await loader(page.value, size).finally(()=>loading.value = false)
        finished.value = page.value * 50 > rs.count
        list.value.push(...rs.list)
    },300)
    load()

    return {
        page,
        list,
        loading,
        finished,
        load
    }
}
