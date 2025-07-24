<script setup lang="ts">
import useAsyncFunction from '@/composables/useAsyncFunction'
import { router } from '@/router'
import TargetClient from '../update-email/TargetClient.vue'

const current = '0905****1234'
const otp = ref('')
const phone = ref('')
const { todo, doing } = useAsyncFunction((values: any) => {
    console.log(values)
    return Promise.delay(1000).then(() => {
        router.replace('/success/updated')
    })
})
</script>

<template>
    <nav-bar title="修改手机号码"></nav-bar>
    <van-form class="grid items-start gap-16 bg-white p-16" @submit="todo">

        <TargetClient :target="current" :is-email="false" />

        <CodeInput v-model="otp" name="otp" type="phone" />

        <PhoneNumberInput v-model="phone" :placeholder="$t('form.placeholder.new_phone')" />
        <div class="h-32"></div>
        <van-button :disabled="doing" type="primary" block native-type="submit">
            {{ $t('app.change') }}
        </van-button>
    </van-form>

</template>

<style lang="scss"></style>
