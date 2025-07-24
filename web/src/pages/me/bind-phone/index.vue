<script setup lang="ts">
import useAsyncFunction from '@/composables/useAsyncFunction'
import { router } from '@/router'

const phone = ref('')
const otp = ref('')

const { todo, doing } = useAsyncFunction((values: any) => {
    console.log(values)
    return Promise.delay(1000).then(() => {
        router.replace('/success/bound')
    })
})
</script>

<template>
    <nav-bar :title="$t('page.bindPhone')"></nav-bar>

    <van-form class="bg-white p-16 grid gap-16" @submit="todo">
        
        <PhoneNumberInput v-model="phone" autofocus/>

        <CodeInput v-model="otp" :target="phone" name="otp" type="phone" />

        <div class="h-32"></div>

        <van-button :disabled="doing" type="primary" block native-type="submit">
            {{ $t('app.bind') }}
        </van-button>
    </van-form>

</template>

<style lang="scss"></style>
