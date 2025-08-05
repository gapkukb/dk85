<script setup lang="ts">
import { useLocale } from '@/locales'
import Login from './Login.vue'
import Signup from './Signup.vue'
import Recover from './Recover.vue'
import { modals } from '@/modals'

const { localeName } = useLocale()
const signup = ref(false)
</script>

<template>
    <header class="sticky top-0 flex p-24 gap-16 bg-white z-1">
        <button
            class="page-account-button"
            @click="modals.authentication.open"
        >
            <i-icon-park-outline:international />
            <span>{{ localeName }}</span>
            <i-iconamoon:arrow-down-2-fill />
        </button>
        <div class="flex-1"></div>

        <CallCenter class="page-account-button" icon-class="scale-140"/>

        <button class="page-account-button icon" @click="modals.authentication.close">
            <van-icon name="cross" />
        </button>
    </header>

    <img
        src="/pwa-512x512.png"
        class="size-152 block mx-auto"
    />

    <div class="flex gap-48 justify-center h-80 text-32 my-48 text-#999">
        <button
            class="uppercase"
            :class="{ 'text-primary font-semibold': !signup }"
            @click="signup = false"
        >
            {{ $t('me.login') }}
        </button>
        <button
            class="uppercase"
            :class="{ 'text-primary font-semibold': signup }"
            @click="signup = true"
        >
            {{ $t('me.signup') }}
        </button>
    </div>

    <Signup v-if="signup" />
    <Login
        v-else
        @forgot="$emit('forgot')"
    />
</template>

<style lang="scss">
.page-account {
    background: url('@/assets/images/account-bg.webp') no-repeat 0 0/100% auto;
}
.page-account-button {
    @apply inline-flex gap-16 items-center h-64 text-24 bg-#ffebe7 text-primary rd-full px-16;

    &.icon {
        @apply aspect-ratio-square;
        & > .van-icon {
            @apply scale-130;
        }
    }
}
</style>
