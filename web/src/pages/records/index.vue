<script setup lang="ts">
import CallCenter from '@/components/call-center/CallCenter.vue';
import GameRecords from './game.vue';
import FundsRecords from './funds.vue';
import DepositRecords from './deposit.vue';
import WithdrawRecords from './withdraw.vue';

const show = ref(false);
const cascaderValue = ref('0');
const options = [
    {
        text: '账变记录',
        value: '0',
    },
    {
        text: '游戏记录',
        value: '1',
    },
    {
        text: '充值记录',
        value: '2',
    },
    {
        text: '提现记录',
        value: '3',
    },
];
// 全部选项选择完毕后，会触发 finish 事件
const onFinish = ({ selectedOptions }) => {
    show.value = false;
};
</script>

<template>
    <nav-bar>
        <h1 class="absolute left-1/2 translate-x--1/2" @click="show = true">
            <span class="mr-8 font-bold fs-28">ငွေပြောင်းလဲမှုများ</span>
            <i class="iconfont iconfont-arrow-down-filled c-primary"></i>
        </h1>

        <template #actions>
            <button class="ml-auto">
                <i class="iconfont iconfont-guolvqi"></i>
            </button>
            <CallCenter />
        </template>
    </nav-bar>

    <!-- <GameRecords /> -->
    <!-- <FundsRecords /> -->
    <DepositRecords />
    <!-- <WithdrawRecords /> -->

    <van-popup v-model:show="show" round position="bottom">
        <van-cascader v-model="cascaderValue" :options="options" @close="show = false" @finish="onFinish" class="records"/>
    </van-popup>

</template>

<style lang="scss">
.van-dropdown-menu__bar {
    background: none;
}
.records .van-tabs__wrap{
    display: none;
}
</style>