<script setup lang="ts">
import { callCenter } from '@/components/call-center';

const menus: { title: any, to?: string, handler: (...args: any) => any, className?: string }[] = [
    { title: t('me.turnOver'), to: '/me/account', handler() { } },
    { title: t('me.account'), to: '/me/account', handler() { } },
    { title: t('page.vip'), className: 'text-primary', to: '/vip', handler() { } },
    { title: t('me.invite'), to: '/act/invitation', handler() { } },
    { title: t('me.collection'), to: '/me/favorites', handler() { } },
    { title: t('me.service'), handler: callCenter },
    { title: t('me.message'), to: '/messages', handler() { } },
    { title: t('me.more'), to: '/me/more', handler() { } },
]


</script>

<template>
    <van-cell title="Player 12345" title-class="font-medium" center is-link class="rd-4 !bg-white !bg-op-80"
        label-class="font-normal flex items-center">
        <template #icon>
            <img src="https://picsum.photos/id/1/80/80" class="size-56 grid-row-span-2 object-cover rd-full mr-8" />
        </template>
        <template #label>
            <span>ID：123123</span>
            <button><i-material-symbols-light:content-copy-outline /></button>
        </template>

    </van-cell>
    <div class="h-8"></div>
    <account-balance>
        <div class="flex gap-16 pt-8">
            <button class="me-wallet-button filled" @click="$router.push('/wallet/deposit')">
                {{ $t('app.deposit') }}
            </button>
            <button class="me-wallet-button plain" @click="$router.push('/wallet/withdrawal')">
                {{ $t('app.withdrawal') }}
            </button>
        </div>
    </account-balance>
    <div class="h-16"></div>
    <van-cell-group>
        <van-cell v-for="menu in menus" :key="menu.title" is-link :title-class="['font-medium', menu.className]"
            :title="menu.title" :to="menu.to" @click="menu.handler" />

    </van-cell-group>
</template>

<style lang="scss">
.page-me {
    @apply p-8;
    //background: #fff url(./assets/balance-bg.png) no-repeat 50% 0/109%;
    // background: linear-gradient(transparent 170px, #fff 0),
    //     radial-gradient(circle at 0% 0%,
    //         rgba(#ff5800, 0.1),
    //         rgba(#ff5800, 0.2) 50vw,
    //         rgba(#ff5800, 0.3) 75vw,
    //         rgba(#ff5800, 0.4) 110vw,
    //     ),

    background: linear-gradient(transparent 220px, #fff 0), linear-gradient(90deg, #ff9b65, #ff5800);


}



.me-wallet-button {
    @apply h-32 rd-full lh-1 flex-1 color-#ff5800;

    &.filled {
        @apply bg-current;

        &:first-line {
            color: white;
        }
    }

    &.plain {
        @apply bg-white;

        &:first-line {
            color: currentColor;
        }
    }
}
</style>
