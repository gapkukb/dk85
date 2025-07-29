<script setup lang="ts">
import { register } from '@/api/user.api'
import { useUser } from '@/stores/user.store'
import { showLoadingToast, showToast } from 'vant'


const user = useUser()
const password = ref('')
const key = ref(1)
function signup(form: any) {
    form.time = Date.now().toString()
    register(form).then(rs => {
        showToast('注册成功')
        // useUser().login()
    }).finally(() => key.value++)
}

</script>

<template>
    <van-form class="px-24 grid gap-16" @submit="signup">
        <AccountInput />

        <PasswordInput v-model="password" />

        <PasswordInput :password="password" is-repeat />

        <PhoneNumberInput />

        <GraphicInput :key="key" />
        <div class="h-16"></div>
        <van-button type="danger" class="uppercase" native-type="submit">
            {{ $t( "me.signup") }}
        </van-button>
    </van-form>
</template>

<style lang="scss"></style>
