<script setup lang="ts">
import { showToast } from 'vant';
import Fitler from "./Filter.vue"
import { useBack } from '@/composables/useBack';


const value = ref('')
const active = ref(0)
const onSearch = (val: string) => showToast(val);
const onClickButton = () => showToast(value.value);
const tabs = [
    { name: 'All', value: "all" },
    { name: 'Slot', value: "slot" },
    { name: 'Fishing', value: "fishing" },
    { name: 'Poker', value: "poker" },
    { name: 'Casino', value: "casino" },
]
const platform = ref(tabs[0].value)
const back = useBack()

function filter(value: string) {
    platform.value = value;
}
const fill = '#d5d5d5'
</script>

<template>
    <header class="sticky top-0 bg-white z-1">
        <van-search v-model="value" placeholder="请输入搜索关键词" shape="round" background="#fff" right-icon="search"
            left-icon="" show-action autocomplete="off" clearable autofocus @search="onSearch"
            @click-right-icon="onSearch(value)">
            <template #action>
                <!-- <div @click="onClickButton">All games</div> -->
                <Fitler />
            </template>
            <template #left>
                <button class="block w-42 ml--12 text-18" @click="back">
                    <van-icon name="arrow-left" />
                </button>
            </template>
        </van-search>
        <div class="flex h-40 px-12 py-8">
            <button v-for="tab in tabs" class="px-8" :class="{ 'search-tab-active': tab.value === platform }"
                @click="filter(tab.value)">{{ tab.name
                }}</button>
        </div>
    </header>
    <Skeleton repeatable fixed item-height="300" item-width="250" width="96.8%">
        <rect x="24" width="234" height="264" />
        <rect x="24" width="234" height="156" :fill="fill" />
        <rect x="32" y="172" width="200" height="28" :fill="fill" />
        <rect x="32" y="220" width="100" height="28" :fill="fill" />
        <circle cx="220" cy="232" r="16" :fill="fill" />
    </Skeleton>
    <!-- <main class="grid grid-cols-3 gap-8 px-12 isolate">
        <GameCard v-for="i in 30" class="aspect-ratio-70/100 bg-#eee rd-4" />
    </main> -->
</template>

<style lang="scss">
.search-tab-active {
    @apply bg-#ff5800 text-#fff font-bold rd-2;
}
</style>