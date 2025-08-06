<script setup lang="ts">
import useBalance from '@/composables/useBalance'
import Checkin from './Checkin.vue'
import Promos from './Promos.vue'
import Record from './Record.vue'
</script>

<template>
    <AccountBalance>
        <!-- <Record /> -->
    </AccountBalance>
    <Checkin />

    <div class="h-32"></div>

    <Promos />

    <!-- <Skeleton repeatable fixed item-height="164" class="px-12" fill="#d1d1d1">
        <rect width="100%" height="158" fill="#eee" rx="4" ry="4"/>
        <rect width="100%" height="60" y="98" fill="#e1e1e1"  ry="4"/>
        <rect width="60" height="28" x="303" y="120" rx="14" />
        <rect width="200" height="20" x="8" y="118" />
        <rect width="100" height="14" x="8" y="140" />
    </Skeleton> -->
</template>

<style lang="scss">

</style>
