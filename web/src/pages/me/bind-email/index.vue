<script setup lang="ts">
import useAsyncFunction from '@/composables/useAsyncFunction'
import { router } from '@/router'

const showGraphic = ref(false)
const grachicValue = ref('')
const email = ref('')
const otp = ref('')
let promise: PromiseWithResolvers<boolean>

const { todo, doing } = useAsyncFunction((values: any) => {
    return Promise.delay(1000).then(() => {
        router.replace('/success/bound')
    })
})


</script>

<template>
    <nav-bar :title="$t('page.bindEmail')"></nav-bar>
    <van-form @submit="todo" class="grid items-start gap-16 bg-white p-16">
        <EmailInput v-model="email" autofocus/>

        <CodeInput v-model="otp" :target="email" type="email" name="otp" />

        <div class="h-32"></div>

        <van-button :loading="doing" type="primary" block native-type="submit" @click="todo">
            {{ $t('app.change') }}
        </van-button>

    </van-form>
</template>

<style lang="scss"></style>
