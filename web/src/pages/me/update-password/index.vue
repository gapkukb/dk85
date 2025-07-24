<script setup lang="ts">
import { CallCenter2 } from '@/components/call-center'
import useAsyncFunction from '@/composables/useAsyncFunction'
import { router } from '@/router'

const phone = ref('')
const otp = ref('')
const password = ref('')
const repassword = ref('')

const { todo, doing, successful } = useAsyncFunction((values: any) => {
    console.log(values)
    return Promise.delay(1000).then(() => {
        router.replace('/success/updated')
    })
})
</script>

<template>
    <nav-bar title="修改密码"></nav-bar>
    <van-form @submit="todo" class="bg-white grid gap-16 p-16">
        <PhoneNumberInput v-model="phone" autofocus />

        <CodeInput v-model="otp" :cs="false" type="phone" name="otp" :target="phone" graphic-required />

        <PasswordInput v-model="password" :placeholder="$t('form.placeholder.newPassword')" />

        <PasswordInput v-model="repassword" is-repeat :password="password"
            :placeholder="$t('form.placeholder.newRepassword')" />

        <CallCenter2 class="!mt--6" />

        <div class="h-32"></div>

        <van-button :disabled="doing" type="primary" block native-type="submit">
            {{ $t('app.change') }}
        </van-button>
    </van-form>

</template>

<style lang="scss"></style>
