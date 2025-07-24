<script setup lang="ts">
import { rpx } from '@/utils/rpx'
import img from '../home/assets/images/9.png'
import type { SwipeInstance } from 'vant'
import { useTimeout } from '@vueuse/core'

const height = rpx(150)
const banners = shallowRef<string[]>([])
const swiper = useTemplateRef<SwipeInstance>('swiper')

useTimeout(0, {
    callback() {
        banners.value = Array.from<string>({ length: 6 }).fill(img)
    },
})

function swipeTo(index: number) {
    swiper.value?.swipeTo(index)
}
</script>

<template>
    <Skeleton v-if="banners.length === 0" :height="height" />
    <van-swipe v-else :autoplay="5000" indicator-color="white" :height="height" ref="swiper">
        <van-swipe-item v-for="(item, index) in banners" :key="index">
            <img :src="item" class="size-full object-cover rd-8" />
        </van-swipe-item>
        <template #indicator="{ active, total }">
            <div class="flex h-40 text-12 bg-white">
                <button v-for="(_, index) in total" class="indicator-item" :class="{ 'indicator-active': index === active }" @click="swipeTo(index)">demo-{{ index }}</button>
            </div>
        </template>
    </van-swipe>
</template>

<style lang="scss" scoped>
.indicator-item {
    @apply flex-1 truncate px-4;
    border-top: 4px solid transparent;
}
.indicator-active {
    border-top-color: #ff5800;
    background: linear-gradient(#ff5800 -100%, transparent);
}
</style>
