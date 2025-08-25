<script setup lang="ts">
import { callCenter } from '@/components/call-center';
import names from '@/router/names';



const tabs = [
    { name: t('app.deposit'), path: 'deposit' },
    { name: t('app.withdrawal'), path: 'withdrawal' },
]
</script>

<template>
    <div class="px-24 pt-24 bg-white">
        <h1 class="fs-64 mb-40 font-semibold pl-24">{{ $t("app.funds") }}</h1>

        <AccountBalance />
        <div class="flex mt-48">
            <button class="funds-menu van-haptics-feedback" @click="$router.push({name:names.account})">
                <div class="funds-menu-icon">
                    <i class="iconfont iconfont-zidongqukuanji"></i>
                </div>
                <p class="funds-menu-title">{{ $t("funds.banks") }}</p>
            </button>
            <button class="funds-menu van-haptics-feedback" @click="$router.push({ name: names.topupHistory })">
                <div class="funds-menu-icon">
                    <i class="iconfont iconfont-yuyuejilu"></i>
                </div>
                <p class="funds-menu-title">{{ $t("funds.history") }}</p>
            </button>
            <button class="funds-menu van-haptics-feedback" @click="$router.push({ name: names.fundRecords })">
                <div class="funds-menu-icon">
                    <i class="iconfont iconfont-genzongjilu"></i>
                </div>
                <p class="funds-menu-title">{{ $t("funds.records") }}</p>
            </button>
            <button class="funds-menu van-haptics-feedback" @click="callCenter">
                <div class="funds-menu-icon">
                    <i class="iconfont iconfont-kefu"></i>
                </div>
                <p class="funds-menu-title">{{ $t("me.service") }}</p>
            </button>

        </div>
        <div class="h-72"></div>
    </div>

    <div class="funds-tabs bg-white">
        <router-link v-for="tab in tabs" :key="tab.name" :to="tab.path" custom v-slot="{ isActive, navigate }">
            <button @click="navigate" class="funds-type-button" :class="{ on: isActive }">{{ tab.name }}</button>
        </router-link>
    </div>

    <router-view />

    <!-- <Deposit v-if="isDeposit" key="1" /> -->
    <!-- <Withdrawal v-else key="2" /> -->



    <!-- <router-view></router-view> -->
</template>

<style lang="scss">
.page-funds {
    // background-color: #fff;
    padding-left: 0;
    padding-right: 0;
}

.funds-menu {
    flex: 0 1 100%;
    display: block;

    &-icon {
        @apply rd-16 size-96 text-56 mx-auto inline-grid place-items-center c-#f65501;
        background: radial-gradient(91.65% 64.13% at 48.96% 0%, #FFECE2 0%, #FFCBAF 100%);
        border-bottom: #ffae83 6px solid;
    }

    &-title {
        @apply fs-24 c-#999 mt-16 h-2em lh-[1] line-clamp-2;
    }
}

.funds-tabs {
    @apply flex gap-82 pl-48;
    border-bottom: 1px solid #A5AFB6;
}

.funds-type-button {
    height: 56px;
    color: #999;
    font-size: 28px;
    text-transform: uppercase;

    &.on {
        color: #111;
        font-weight: bold;
        font-size: 40px;
        text-underline-offset: 12px;
        text-decoration: underline 2px red;
    }
}
</style>