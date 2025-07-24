<script setup lang="ts">
import type { views } from './levels.config';

const props = defineProps<{
    view: (typeof views)[keyof (typeof views)]
}>()
</script>

<template>
    <div class="inline-grid grid-cols-[auto_1fr] grid-auto-rows-12 p-4 gap-4">
        <div class="grid-row-span-2 op-50">
            <i class="iconfont fs-24 c-#fc884a" :class="view.icon"></i>
        </div>
        <h6 class="op-30">{{ view.title }}</h6>
        <h5 class="font-medium">
            <span class="">0.00</span>
            <span class="">MMK</span>
        </h5>
    </div>
</template>

<style lang="scss" scoped></style>