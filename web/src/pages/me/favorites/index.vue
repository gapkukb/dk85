<script setup lang="ts">
import { rpx } from '@/utils/rpx'
</script>

<template>
    <nav-bar :title="$t('page.favorites')" />
    <game-table />
    <van-empty
        class="lh-none fixed left-1/2 top-1/2 -translate-1/2 w-fit z--1 whitespace-nowrap"
        description="你还没有收藏任何游戏"
    >
        <template #image>
            <i class="iconfont iconfont-nothing !fs-300 c-primary"></i>
        </template>

        <van-button to="/" replace type="danger" size="small">查看所有游戏</van-button>
    </van-empty>
</template>

<style lang="scss"></style>
