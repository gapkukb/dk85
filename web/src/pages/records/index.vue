<script setup lang="ts">
import CallCenter from '@/components/call-center/CallCenter.vue';
import names from '@/router/names';

</script>

<template>
    <nav-bar>
        <h1 class="absolute left-1/2 translate-x--1/2 whitespace-nowrap">
            <span class="font-bold fs-28" @click="$router.push({ name: names.fundRecords })">ငွေပြောင်းလဲမှုများ</span>
            <span class="ml-8 fs-28" @click="$router.push({ name: names.gameRecords })">ဂိမ်းမှတ်တမ်းများ</span>
        </h1>


        <template #actions>
            <CallCenter class="ml-auto" />
        </template>
    </nav-bar>

    <router-view />


</template>

<style lang="scss">
.van-dropdown-menu__bar {
    background: none;
}

.records .van-tabs__wrap {
    display: none;
}
</style>