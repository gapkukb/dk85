import { useQuery } from '@tanstack/vue-query'
import type { GAME_TYPE } from '@/constants/game.const'
// import db from '@/utils/db'
import { queryAllGame } from '@/api/game.api'

export default function (gameType: GAME_TYPE) {
    const pageNo = ref(1)
    const pageSize = 50

    const { isLoading, data, refetch } = useQuery<any[]>({
        queryKey: ['game-list', gameType],
        retry:0,
        queryFn: () => queryAllGame({ game_id: gameType }),
    })

    const showList = computed(() => data.value!.slice(0, pageNo.value * pageSize))

    const hasMore = computed(() => data.value!.length > showList.value.length)

    return {
        pageNo,
        isLoading,
        showList,
        hasMore,
        refetch,
    }
}
