<script setup lang="ts">
import useBalance from '@/composables/useBalance'
import Checkin from './Checkin.vue'
// import Promos from './Promos.vue'
import Record from './Record.vue'
</script>

<template>
    <AccountBalance>
        <Record />
    </AccountBalance>
    <Checkin />

    <div class="h-16"></div>

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
.page-promos  {
    // background: url(./assets/bg.png) no-repeat 0 -16px/100% auto;
    padding: 8px;
    padding-bottom: var(--h-footer);
    --image: url('@/assets/icons/accout-balance-bg.svg');
    --transparent: url(data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==);
    background-image: var(--image);
    background-image: cross-fade(var(--transparent), var(--image), 80%);
    background-image: -webkit-cross-fade(var(--transparent), var(--image), 90%);
    background-size: 100% 220px;
    background-repeat: no-repeat;
}
</style>
