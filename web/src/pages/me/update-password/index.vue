<script setup lang="ts">
import { updatePassword } from '@/api/user.api'
import { CallCenter2 } from '@/components/call-center'
import useAsyncFunction from '@/composables/useAsyncFunction'
import { router } from '@/router'

const password = ref('')

const { todo, doing, successful } = useAsyncFunction((values: any) => {
    return updatePassword(values).then(() => {
        router.replace('/success/updated')
    })
})
</script>

<template>
    <nav-bar title="修改密码"></nav-bar>
    <van-form @submit="todo" class="bg-white grid gap-16 p-16">

        <PasswordInput name="old_password" :placeholder="$t('form.placeholder.password')" />

        <PasswordInput name="new_password" v-model="password" :placeholder="$t('form.placeholder.newPassword')" />

        <PasswordInput is-repeat :password="password" :placeholder="$t('form.placeholder.newRepassword')" />

        <CallCenter2 class="!mt--6" />

        <div class="h-32"></div>

        <van-button :disabled="doing" type="primary" block native-type="submit">
            {{ $t('app.change') }}
        </van-button>
    </van-form>

</template>

<style lang="scss"></style>
