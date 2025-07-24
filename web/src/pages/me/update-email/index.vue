<script setup lang="ts">
import useAsyncFunction from '@/composables/useAsyncFunction'
import { router } from '@/router'
import TargetClient from './TargetClient.vue'

const current = 'abc***efg@gmail.com'
const email = ref('')
const otp = ref('')

const { todo, doing } = useAsyncFunction((values: any) => {
    return Promise.delay(1000).then(() => {
        router.replace('/success/updated')
    })
})



</script>

<template>
    <nav-bar :title="$t('page.updatEmail')"></nav-bar>
    <van-form @submit="todo" class="grid items-start gap-16 bg-white p-16">

        <TargetClient is-email :target="current" />

        <CodeInput v-model="otp" type="email" name="otp" />

        <EmailInput v-model="email" :placeholder="$t('form.placeholder.newEmail')" />

        <div class="h-32"></div>

        <van-button :loading="doing" type="primary" block native-type="submit">
            {{ $t('app.bind') }}
        </van-button>
    </van-form>

</template>

<style lang="scss"></style>
