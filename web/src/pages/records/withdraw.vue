<script setup lang="ts">
import CallCenter from '@/components/call-center/CallCenter.vue';

const value1 = ref(0);
const option1 = [
    { text: '账变记录', value: 0 },
    { text: '游戏记录', value: 1 },
];
const list = ref([]);
const loading = ref(false);
const finished = ref(false);

const onLoad = () => {
    // 异步更新数据
    // setTimeout 仅做示例，真实场景中一般为 ajax 请求
    setTimeout(() => {
        for (let i = 0; i < 10; i++) {
            list.value.push(list.value.length + 1);
        }

        // 加载状态结束
        loading.value = false;

        // 数据全部加载完成
        if (list.value.length >= 40) {
            finished.value = true;
        }
    }, 1000);
};
</script>

<template>
    <nav-bar>
        <h1 class="absolute left-1/2 translate-x--1/2">
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

    <van-list v-model:loading="loading" :finished="finished" finished-text="没有更多了" @load="onLoad">
        <van-cell-group>
            <van-cell v-for="item in list" title="ပလက်ဖောင်းငွေရလွှဲမှု" label="2025/08/11 16:25:30" center>
                <span class="c-primary font-600">-28.00</span>
            </van-cell>
        </van-cell-group>
    </van-list>

    <!-- <van-divider>没有更多了</van-divider> -->
</template>

<style lang="scss">
.van-dropdown-menu__bar {
    background: none;
}
</style>