<script setup lang="ts">
const props = defineProps({ showDeposit: { default: true } })
import { modals } from '@/modals'
import { useUser } from '@/stores/user.store'
const user = useUser()
</script>

<template>
    <div v-if="user.authenticated" class="home-account">
        <img src="/logo3.webp" class="size-56" />
        <div class="flex-1 lh-none">
            <div class="">
                <span class="c-#FFF3C5 text-20">ID:123456</span>
                <span class="bg-#fffac4 rd-4 text-16 px-8 font-semibold c-primary font-italic ml-8">VIP1</span>
            </div>
            <Balance class="text-white text-24" balance-class="font-semibold mr-16" button-class="fs-22 expand-4" />
        </div>
        
        <van-button v-if="showDeposit" class="min-w-154 !c-primary !h-full font-bold !fs-24" round color="#fff0e3"
            to="/funds/deposit">
            {{ $t('app.deposit') }}
        </van-button>
    </div>

    <van-button v-else round type="danger" size="small" class="min-w-250" @click="modals.authentication.open">
        {{ $t('me.login') }} | {{ $t('me.signup') }}
    </van-button>
</template>

<style lang="scss">
.home-account {
    @apply h-64 flex gap-16 bg-#f5f5f5 rd-full p-4 items-center;
    background: linear-gradient(0deg, #ff5800, #ff5800),
        radial-gradient(267.26% 37.17% at 14.65% 0%, rgba(255, 255, 255, 0.301) 0%, rgba(255, 230, 215, 0.0001) 100%);
}
</style>
