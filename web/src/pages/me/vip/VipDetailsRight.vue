<script setup lang="ts">
import { formatter } from '@/utils/number';
import levels, { views } from './levels.config';
import VipDetailsRightItem from './VipDetailsRightItem.vue';

const props = defineProps<{
    index: number
}>()
const level = levels[props.index]
</script>

<template>
    <div class="grid grid-rows-[38px_1fr] h-120 rd-4">
        <h3 class="flex bg-#e5e5e5 lh-38 px-8 rd-t-8 ">
            <span class="c-#853e00 font-medium">VIP{{ level.level }}{{ $t('me.vip.rights') }}</span>
            <span class="c-#808385 ml-auto pr-4">Valid Bet:</span>
            <span class="c-#853e00 font-medium">0.00</span>
        </h3>
        <div class="bg-#eee grid grid-cols-2 grid-rows-2 rd-b-8">
            <VipDetailsRightItem :view="views.advance" />
            <VipDetailsRightItem :view="views.weekly" />
            <VipDetailsRightItem :view="views.monthly" />
            <VipDetailsRightItem :view="views.annual" />
        </div>
    </div>
</template>

<style lang="scss"></style>