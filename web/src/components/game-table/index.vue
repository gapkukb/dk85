<script setup lang="ts">
import { queryGameUrl } from '@/api/game.api';
import useDelegate from '@/composables/useDelegate'
import useIsNotAuthenticated from '@/composables/useIsAuthenticated';
import useLoadMore, { usePagination } from '@/composables/useLoadMore'
import { useUser } from '@/stores/user.store';
import { showDialog } from 'vant'

const props = defineProps<{ listClass?: any; titleClass?: any; title?: string; games?: model.game.Game[]; gameClass?: any; cols?: number | string; paginable?: boolean }>()
const user = useUser()
const todo = useDelegate({
    // attrs: ['data-game-index', 'data-fav-index'] as const,
    attrs: ['data-game-index'] as const,
    async hanlder(value, attr) {
        if (useIsNotAuthenticated()) return;
        await showDialog({
            title: '即将进入游戏!',
            showCancelButton: true,
        })
        const game = props.games![value as any];
        const { url } = await queryGameUrl({
            game_id: 17,
            key: game.code,
            game_platform: game.platform,
            mobile: 1,
        })
        const gameUrl = window.encodeURIComponent(window.encodeURIComponent(url))
        window.open('/gaming.html?gameUrl=' + gameUrl, 'gaming')
    },
})

const { add, hasMore, showList, vIntersect } = usePagination(computed(() => props.games || []))


</script>

<template>
    <div class="game-list" :style="{ '--cols': cols ?? 3 }">
        <h4 v-if="title" class="game-list-title" :class="titleClass">
            {{ title }}
        </h4>
        <div class="game-list-body grid" :class="listClass" @click="todo">
            <Game v-for="(game, index) in showList" :key="game.code" :index="index" :class="gameClass" :is-fav="true"
                :poster="game.img" :name="game.name" :platform-name="game.platform" />
        </div>

        <!-- <template v-if="paginable">
            <van-divider v-if="loading || done" style="margin-bottom: 0; font-size: 12px">
                {{ loading ? $t('app.loadingMore') : $t('app.noMore') }}
            </van-divider>
            <div v-intersect="loadMore" class="h-1"></div>
        </template> -->
        <div v-if="hasMore" v-intersect="add" class="h-1"></div>
    </div>
</template>

<style lang="scss">
.game-list {
    // @apply bg-white rd-8;
    touch-action: pan-y;

    &-title {
        @apply fs-28 font-bold lh-[1] indent-0.5em mb-24;
        border-left: 4px solid red;
    }

    &-body {
        display: grid;
        grid-template-columns: repeat(var(--cols), minmax(0, 1fr));
        gap: 16px;
        border-radius: 8px;
    }
}
</style>
