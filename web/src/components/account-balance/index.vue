<script setup lang="ts">
import useBalance from '@/composables/useBalance'
import CountUp from 'vue-countup-v3'
const { balance, refresh, loading } = useBalance()
</script>

<template>
    <div class="account-balance">
        <div class="text-12 flex items-center gap-8">
            <span>{{ $t('app.balance') }}</span>
            <button class="lh-1 expand-8" :class="{ spin: loading }" @click="refresh">
                <i-system-uicons:refresh-alt />
            </button>
        </div>
        <h1>
            <count-up :end-val="balance" :duration="1" :decimal-places="2" class="text-36 font-bold"/>
            <span class="text-16 pl-4">MMK</span>
        </h1>

        <slot />
    </div>
</template>

<style lang="scss">
.account-balance {
    --image: url('@/assets/icons/accout-balance-bg.svg');
    --transparent: url(data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==);
    background-image: var(--image);
    background-image: cross-fade(var(--transparent), var(--image), 80%);
    background-image: -webkit-cross-fade(var(--transparent), var(--image), 1);
    background-size: 100% 100%;
    @apply min-h-110 p-16 relative rd-8 text-white;
}
</style>
