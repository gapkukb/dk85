<script setup lang="ts">
import useBalance from '@/composables/useBalance'
import CountUp from 'vue-countup-v3'

defineProps<{ large?: boolean }>()

const { balance, refresh, loading } = useBalance()


</script>

<template>
    <div class="account-balance">
        <slot name="header"></slot>
        <div class="text-28 flex items-center justify-between gap-16">
            <span>{{ $t('app.balance') }}</span>
            <button
                class="lh-1 expand-16 fs-32"
                :class="{ spin: loading }"
                @click="refresh"
            >
                <i class="iconfont iconfont-refresh"></i>
            </button>
        </div>
        <h1 class="flex items-baseline">
            <count-up
                :end-val="balance"
                :duration="1"
                :decimal-places="2"
                class="text-80 font-bold"
            />
            <span class="text-48 pl-8">MMK</span>
        </h1>

        <slot />
    </div>
</template>

<style lang="scss">
.account-balance {
    background: url(./bg.png) no-repeat center bottom 30%/90%, radial-gradient(67.74% 70.69% at 13.11% 0%, #ff8544 0%, #ff5800 100%),
        radial-gradient(43.8% 11.96% at 50% 100%, rgba(255, 255, 255, 0.2) 26.02%, rgba(255, 88, 0, 0) 100%);

    @apply min-h-232 px-48 py-32 relative rd-16 text-white;
}
</style>
