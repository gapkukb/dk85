<script setup lang="ts">
import { formatter } from '@/utils/number'

const isFav = ref(false)
</script>

<template>
    <div class="ske grid bg-#ddd rd-8">
        <div class="flex items-center justify-center aspect-ratio-1">
            <i class="iconfont iconfont-yule !fs-100 c-#ccc"></i>
        </div>
        <div class="h-32 bg-#ccc"></div>
    </div>
</template>

<style lang="scss">
.ske {
    animation: ske 1s ease-in-out infinite alternate-reverse;
}

@keyframes ske {
    0%,
    50% {
        opacity: 1;
    }
    100% {
        opacity: 0.6;
    }
}
</style>
