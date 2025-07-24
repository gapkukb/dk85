<script setup lang="ts">
import { rpx } from '@/utils/rpx';

const active = ref(0)
</script>

<template>
    <!-- <div class="grid gap-12 grid-cols-2 grid-rows-[115_80] p-12">
        <div class="grid-col-span-2">
            <img src="../home/assets/images/9.png" class="size-full object-cover">
        </div>
        <div>
            <img src="../home/assets/images/9.png" class="size-full object-cover">
        </div>
        <div>
            <img src="../home/assets/images/9.png" class="size-full object-cover">
        </div>
    </div>

    <div class="game-list px-12">
        <h6>Most Popular</h6>
        <div class="grid grid-cols-3 gap-8">
            <game-card v-for="i in 30" class=" aspect-ratio-100/140" />
        </div>
    </div> -->
    <!-- <van-tabs v-model:active="active" swipeable sotp>
        <van-tab title="KA Slot"></van-tab>
        <van-tab title="KA Slot"></van-tab>
        <van-tab title="KA Slot"></van-tab>
        <van-tab title="KA Slot"></van-tab>
        <van-tab title="KA Slot"></van-tab>
        <van-tab title="KA Slot"></van-tab>
        <van-tab title="KA Slot"></van-tab>
        <van-tab title="KA Slot"></van-tab>
        <van-tab title="KA Slot"></van-tab>
        <van-tab title="KA Slot"></van-tab>
    </van-tabs> -->


    <div class="all" @touchstart.stop="">
        <div class="slot-tabs scroll-none sticky top-100 z-10">
            <div class="slot-tab on">KA Slot</div>
            <div class="slot-tab">KA Slot</div>
            <div class="slot-tab">KA Slot</div>
            <div class="slot-tab">KA Slot</div>
            <div class="slot-tab">KA Slot</div>
            <div class="slot-tab">KA Slot</div>
        </div>
    </div>
    <div class="h-1000"></div>
</template>

<style lang="scss">
.slot-tabs {
    background-color: #f3f3f3;
    padding: 6px 12px;
    @apply flex overflow-auto gap-8;
}

.slot-tab {
    @apply flex-shrink-0 px-12;

    &.on {
        background-color: #ff5800;
        color: white;
        border-radius: 40px;
    }
}
</style>