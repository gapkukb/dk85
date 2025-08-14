<script setup lang="ts">
import { callCenter } from '@/components/call-center'
import { pagesName } from '@/router'
defineOptions({ name: pagesName.me })

const menus = computed<{ title: any; to?: string; handler: (...args: any) => any; className?: string }[]>(() => {
    return [
        { title: t('me.turnOver'), to: '/me/account', handler() { } },
        { title: t('me.account'), to: '/me/account', handler() { } },
        { title: t('page.vip'), className: 'text-primary', to: '/vip', handler() { } },
        { title: t('me.invite'), to: '/act/invitation', handler() { } },
        { title: t('me.collection'), to: '/me/favorites', handler() { } },
        { title: t('me.service'), handler: callCenter },
        { title: t('me.message'), to: '/message', handler() { } },
        { title: t('me.more'), to: '/me/more', handler() { } },
    ]
})

// const meta = document.head.querySelector('meta[name="theme-color"]') as HTMLMetaElement
// meta.content = '#000'
// onUnmounted(() => {
//     meta.content = '#fff'
//  })
</script>

<template>
    <account-balance style="filter: drop-shadow(#ff5800 0 0 4px)">
        <template #header> 
            <div class="flex items-baseline -mt-72 gap-24 pb-48">
                <img src="/logo2.webp" class="size-96 rd-full" style="box-shadow: #999 0 2px 2 npx 0" />
                <div class="inline-flex items-center gap-8 lh-1">
                    <span>ID：123123</span>
                    <button v-clipboard="123123" class="expand-16">
                        <i class="iconfont iconfont-copy"></i>
                    </button>
                </div>
                <span class="bg-#FFFAC4 ml-auto pl-16 pr-20 fs-24 c-primary font-italic rd-full">VIP1</span>
            </div>
        </template>
        <div class="flex gap-16 pt-8">
            <button class="me-funds-button filled" @click="$router.push('/funds/deposit')">
                {{ $t('app.deposit') }}
            </button>
            <button class="me-funds-button plain" @click="$router.push('/funds/withdrawal')">
                {{ $t('app.withdrawal') }}
            </button>
        </div>
    </account-balance>
    <div class="h-24"></div>
    <van-cell-group>
        <van-cell v-for="menu in menus" :key="menu.title" is-link :title-class="['font-medium', menu.className]"
            :title="menu.title" :to="menu.to" @click="menu.handler" />
    </van-cell-group>
</template>

<style lang="scss">
.page-me {
    @apply pt-72;
    // background: linear-gradient(#000 250px, transparent 0);
}

.me-funds-button {
    @apply h-80 rd-full lh-1 flex-1;

    &.filled {
        @apply bg-white c-primary;
    }

    &.plain {
        @apply c-white;
        border: 4px solid white;
    }
}
</style>
