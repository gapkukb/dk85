<script setup lang="ts">
import useAsyncFunction from '@/composables/useAsyncFunction'

const otp = ref('')
const password = ref('')
const repassword = ref('')
const phone = ref('')
const email = ref('')
const byPhone = ref(true)

const { doing, todo } = useAsyncFunction(function () {
    return Promise.delay(1000)
})
</script>

<template>
    <header class="sticky top-0 flex p-12 gap-8">
        <button class="page-account-button icon" @click="$emit('back')">
            <van-icon name="arrow-left" />
        </button>

        <div class="flex-1"></div>

        <CallCenter class="page-account-button" icon-class="scale-140" />
    </header>

    <img src="/pwa-512x512.png" class="size-76 block mx-auto" />

    <div class="flex gap-24 justify-center h-45 text-16 my-24 text-#999">
        <button class="uppercase" :class="{ 'text-primary font-semibold': byPhone }" @click="byPhone = true">
            {{ $t('account.retrieval.phone') }}
        </button>
        <button class="uppercase" :class="{ 'text-primary font-semibold': !byPhone }" @click="byPhone = false">
            {{ $t('account.retrieval.email') }}
        </button>
    </div>

    <van-form class="px-16 grid gap-16" @submit="todo">
        <PhoneNumberInput v-if="byPhone" v-model="phone" />

        <EmailInput v-else v-model="email" />

        <CodeInput v-if="byPhone" v-model="otp" key="phone" type="phone" :target="phone" graphic-required />
        <CodeInput v-else v-model="otp" key="email" type="email" :target="email" graphic-required />

        <PasswordInput v-model="password" />

        <PasswordInput v-model="repassword" :password="password" is-repeat />
        <div class="h-32"></div>
        <van-button native-type="submit" type="danger" class="uppercase" :loading="doing">
            {{ $t('app.confirm') }}
        </van-button>
    </van-form>
</template>

<style lang="scss"></style>
