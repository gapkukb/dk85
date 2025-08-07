<script setup lang="ts">
import { queryAds } from '@/api';
import { useAdversite } from '@/composables/useAdversite';
import openUrl from '@/helper/open-url';
import { router } from '@/router';
import { rpx } from '@/utils/rpx';
import { useQuery } from '@tanstack/vue-query';

const props = defineProps<{ position: number }>()
const height = rpx(240)
const { navigate, result: banners } = useAdversite(2, props.position)



</script>

<template>
    <van-swipe v-if="banners?.length" :autoplay="3000" indicator-color="white" :height="height" lazy-render>
        <van-swipe-item v-for="banner in banners" :key="banner.image" @click="navigate(banner.url)">
            <img :src="banner.image" class="size-full object-cover rd-8" />
        </van-swipe-item>
    </van-swipe>
</template>

<style lang="scss"></style>