<script setup lang="ts">
import { rpx } from '@/utils/rpx'
</script>

<template>
    <nav-bar :title="$t('page.favorites')" />
    <game-table />
    <empty description="你还没有收藏任何游戏" button-text="查看所有游戏" to="/" />

</template>

<style lang="scss"></style>
