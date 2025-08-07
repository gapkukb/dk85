<script setup lang="ts">
import HomeHeaderAccount from '@/pages/home/HomeHeaderAccount.vue'
import Checkin from './Checkin.vue'
import Promos from './Promos.vue'
// import Record from './Record.vue'
</script>

<template>
    <header class="flex items-center justify-between sticky top-0 py-12 bg-#eef2f5 z-1">
        <HomeHeaderAccount :show-deposit="false" class="!pr-24" />
        <CallCenter class="size-64 c-#6b7984 fs-36 bg-white rd-full" />
    </header>
    <div class="h-16"></div>
    <Checkin />

    <div class="h-32"></div>

    <Promos />
</template>

<style lang="scss"></style>
