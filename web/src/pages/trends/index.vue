<script setup lang="ts">
import { showToast } from 'vant';
import History from '../search/History.vue';
import { ls } from '@/utils/storage';
import { useLs } from '@/composables';
import TrendPanel from './Panel.vue';
import { useBack } from '@/composables/useBack';


const fill = '#d5d5d5'
const router = useRouter()
const keywords = ref('')
const history = useLs<string[]>(ls.keys.search, [])

function searchByInput() {
    const k = keywords.value

    if (k && !history.value.has(k)) {
        history.value = [k, ...history.value]
    }

    return search(k)
};

function searchByAll() {
    return search()
};

function searchByHistory(text: string) {
    return search(text)
}

function search(payload?: string) {
    if (!payload) return router.push('/search')
    return router.push({ path: '/search', query: { keywords: payload } })
}

const back = useBack()

</script>

<template>
    <header class="sticky top-0 bg-white z-1">
        <van-search v-model.trim="keywords" placeholder="请输入搜索关键词" shape="round" background="#fff" right-icon="search"
            left-icon="" show-action autocomplete="off" clearable autofocus @search="searchByInput"
            @click-left-icon="back" @click-right-icon="searchByInput">
            <template #action>
                <div @click="searchByAll">All games</div>
            </template>
            <template #left>
                <button class="block w-42 ml--12 text-18" @click="back">
                    <van-icon name="arrow-left" />
                </button>
            </template>
        </van-search>

    </header>
    <History v-if="history.length" v-model="history" @search="searchByHistory" />
    <div class="h-16"></div>
    <div class="trend-panels">
        <TrendPanel class=" bg-red trend-panel" />
        <TrendPanel class=" bg-blue trend-panel" />
    </div>
</template>

<style lang="scss">
.trend-panels {
    @apply flex gap-8 items-start overflow-x-auto px-12;
    scroll-snap-type: x mandatory;
}

.trend-panel {
    @apply flex-shrink-0 p-12 grid gap-16 w-7/10 rd-4;
    scroll-snap-align: center;
}
</style>