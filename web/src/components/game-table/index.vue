<script setup lang="ts">
import useDelegate from '@/composables/useDelegate'
import useLoadMore from '@/composables/useLoadMore'
import { showDialog } from 'vant'

defineProps<{ listClass?: any; titleClass?: any; title?: string; games?: any[]; gameClass?: any; cols?: number | string; paginable?: boolean }>()
const todo = useDelegate({
    attrs: ['data-game-index', 'data-fav-index'] as const,
    async hanlder(value, attr) {
        if (attr === 'data-fav-index') {
            alert('收藏' + value)
        } else {
            await showDialog({
                message: '即将进入游戏!',
                showCancelButton: true,
            })
            alert('进入游戏' + value)
        }
    },
})
const { done, loading, vIntersect, loadMore } = useLoadMore(async () => {
    await Promise.delay(3000).then(() => {
        done.value = true
    })
})
</script>

<template>
    <div
        class="game-list"
        :style="{ '--cols': cols ?? 3 }"
    >
        <h4
            v-if="title"
            class="game-list-title"
            :class="titleClass"
        >
            {{ title }}
        </h4>
        <div
            class="game-list-body grid"
            :class="listClass"
            @click="todo"
        >
            <Game
                v-for="i in 26"
                :class="gameClass"
                :is-fav="true"
            />
        </div>

        <template v-if="paginable">
            <van-divider
                v-if="loading || done"
                style="margin-bottom: 0; font-size: 12px"
            >
                {{ loading ? $t('app.loadingMore') : $t('app.noMore') }}
            </van-divider>
            <div
                v-intersect="loadMore"
                class="h-1"
            ></div>
        </template>
    </div>
</template>

<style lang="scss">
.game-list {
    @apply bg-white rd-4;
    touch-action: pan-y;

    &-title {
        @apply font-12 font-semibold lh-[1] indent-0.5em mb-12;
        border-left: 2px solid red;
    }

    &-body {
        display: grid;
        grid-template-columns: repeat(var(--cols), minmax(0, 1fr));
        gap: 8px;
        border-radius: 4px;
    }
}
</style>
