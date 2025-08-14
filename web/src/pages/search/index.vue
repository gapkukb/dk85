<script setup lang="ts">

import { useQuery } from '@tanstack/vue-query'
import GameSkeleton from '@/components/game/Skeleton.vue'
import KindFilter from './KindFilter.vue'
import PlatformFilter from './PlatformFilter.vue'
import mock from './mock.json'
import useLoadMore, { usePagination } from '@/composables/useLoadMore'
import { GamesHelper } from '@/shared/game-helper'

const kinds = [
    {
        name: '全部',
        value: '',
    },
    {
        name: '电子游戏',
        value: 'SLOTS',
    },
    {
        name: '捕鱼',
        value: 'FISH',
    },
    {
        name: '棋牌',
        value: 'POKER',
    },
]
const backupKeyword = ref('')
const keyword = ref('')
const selectedKind = ref('')
const selectedPlatforms = shallowRef<string[]>([''])

const { isLoading, data: filteredList } = useQuery({
    gcTime: 0,
    queryKey: ['search-games', keyword, selectedKind, selectedPlatforms] as const,
    queryFn({ queryKey: [_, x, y, z] }) {
        return GamesHelper.queryBy(x, y, z)
    },
})

const { vIntersect, showList, add, hasMore } = usePagination<model.game.Game>(filteredList)

async function filter(value: string) {
    if (value === keyword.value) return
    keyword.value = value
    selectedKind.value = ''
    selectedPlatforms.value = ['']
}
</script>

<template>
    <nav-bar>
        <van-field v-model.trim="backupKeyword" type="search" class="search-field" placeholder="请输入搜索关键词"
            background="#fff" right-icon="search" autocomplete="off" clearable @search="filter"
            @click-right-icon="filter(backupKeyword)" />

        <template #actions>
            <PlatformFilter v-model="selectedPlatforms" />
        </template>
    </nav-bar>

    <KindFilter v-model="selectedKind" :kinds="kinds" class="" />

    <div class="h-72"></div>

    <div v-if="isLoading" class="fixed grid grid-cols-3 left-24 right-24 gap-16">
        <GameSkeleton v-for="i in 21" />
    </div>

    <empty v-else-if="!filteredList?.length" description="" />

    <main v-else class="grid grid-cols-3 gap-16">
        <Game v-for="(item, index) in showList" :poster="item.img" :name="item.name" :platform-name="item.platform"
            :count="item.like_num" :index="index" />
    </main>
    <div v-if="hasMore" class="size-1" v-intersect="add"></div>
</template>

<style lang="scss">
.search-tab-active {
    @apply bg-#ff5800 text-#fff font-bold rd-2;
}

.search-field {
    @apply flex-1 rd-full px-24 py-12;
    // --van-search-input-height: 72px;
    // --van-cell-line-height: 36px;
}
</style>
