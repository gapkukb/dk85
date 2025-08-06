<script setup lang="ts">
import { callCenter } from '@/components/call-center'
import { pagesName } from '@/router'
defineOptions({ name: pagesName.me })

const menus: { title: any; to?: string; handler: (...args: any) => any; className?: string }[] = [
    { title: t('me.turnOver'), to: '/me/account', handler() {} },
    { title: t('me.account'), to: '/me/account', handler() {} },
    { title: t('page.vip'), className: 'text-primary', to: '/vip', handler() {} },
    { title: t('me.invite'), to: '/act/invitation', handler() {} },
    { title: t('me.collection'), to: '/me/favorites', handler() {} },
    { title: t('me.service'), handler: callCenter },
    { title: t('me.message'), to: '/message', handler() {} },
    { title: t('me.more'), to: '/me/more', handler() {} },
]
</script>

<template>
    <!-- <van-cell
        title="Player 12345"
        title-class="font-medium"
        center
        is-link
        class="rd-4 !bg-white !bg-op-80"
        label-class="font-normal flex items-center"
    >
        <template #icon>
            <img
                src="https://picsum.photos/id/1/80/80"
                class="size-56 grid-row-span-2 object-cover rd-full mr-8"
            />
        </template>
        <template #label>
            <span>ID：123123</span>
            <button><i-material-symbols-light:content-copy-outline /></button>
        </template>
    </van-cell>
    <div class="h-8"></div> -->
    <account-balance>
        <template #header>
            <div class="flex items-center -mt-24">
                <img
                    src="/logo2.webp"
                    class="size-96 rd-full shadow-xl shadow-#999"
                />
                <span>vip1</span>
            </div>
        </template>
        <div class="flex gap-16 pt-8">
            <button
                class="me-funds-button filled"
                @click="$router.push('/funds/deposit')"
            >
                {{ $t('app.deposit') }}
            </button>
            <button
                class="me-funds-button plain"
                @click="$router.push('/funds/withdrawal')"
            >
                {{ $t('app.withdrawal') }}
            </button>
        </div>
    </account-balance>
    <div class="h-16"></div>
    <van-cell-group>
        <van-cell
            v-for="menu in menus"
            :key="menu.title"
            is-link
            :title-class="['font-medium', menu.className]"
            :title="menu.title"
            :to="menu.to"
            @click="menu.handler"
        />
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

.me-funds-button {
    @apply h-64 rd-full lh-1 flex-1 color-#ff5800;

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
