<script setup lang="ts">
import CallCenter from '@/components/call-center/CallCenter.vue';
const show = ref(false)
</script>

<template>

    <van-cell-group>
        <van-cell @click="show = true">
            <div class="c-primary font-600">-28.00</div>
            <div class="fs-24 mt-36">2025/08/11 16:25:30</div>
            <template #title>
                <van-badge dot :offset="[8, 12]">Pending payment</van-badge>
            </template>
            <template #label>
                <div>order number</div>
                <div>20250820142123546531231321</div>
            </template>
        </van-cell>
    </van-cell-group>

    <!-- <van-divider>没有更多了</van-divider> -->


    <van-popup v-model:show="show" position="right" class="recharge-detail" style="width: 100%;height: 100%;">
        <div class="p-24">
            <back-button @click="show = false" />
        </div>
        <div class="flex flex-col items-center py-96">
            <i class="iconfont iconfont-dengdaizhongbeifen !fs-156 c-amber"></i>
            <h2 class="fs-32">Pending Payment</h2>
        </div>

        <van-cell title="Order Number">
            <span>11111111111111111111111</span>
            <button v-clipboard="11111111111111111111111" class="iconfont iconfont-copy expand-16"></button>
        </van-cell>
        <van-cell title="Order Amount" value-class="!c-red !font-bold" value="5000.00" />
        <van-cell title="Recharge Method" value-class="!font-bold" value="KBZpay" />
        <van-cell title="Recharge Time" value-class="!font-bold" value="2025-08-11 00:00:00" />
        <van-cell value-class="!text-center !c-primary">
            any questions?
            <CallCenter class="" />
        </van-cell>
        <van-cell>
            <van-button block type="danger">Pay</van-button>
        </van-cell>
    </van-popup>
</template>

<style lang="scss">
.recharge-detail {
    background: #eef2f5;
    --van-cell-background: #eef2f5;
}
</style>