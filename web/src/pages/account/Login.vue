<script setup lang="ts">
import { Modals, ModalsName } from '@/modals'
import { useUser } from '@/stores/user.store'
import login, { LoginType } from '@/utils/login'
import { ls } from '@/utils/storage'
import { showSuccessToast, showToast } from 'vant'

const user = useUser()
const account = ref(ls.get(ls.keys.currentUser, ''))
const rememberMe = ref(false)

async function doLogin(form: any) {
    await login(form)
    showSuccessToast({
        message: "登录成功",
        forbidClick: true,
        onClose() {
            Modals.close(ModalsName.login)
        },
    })
    if (rememberMe.value) {
        ls.set(ls.keys.currentUser, account.value)
    }
}
</script>

<template>
    <van-form class="px-24 grid gap-16" @submit="doLogin">
        <AccountInput v-model="account" />

        <PasswordInput />

        <GraphicInput />

        <div class="flex items-center justify-between py-16">
            <van-checkbox v-model="rememberMe" icon-size="16" checked-color="#ff5800" class="text-12">
                {{ $t('form.placeholder.remember') }}
            </van-checkbox>
            <button class="text-12 text-primary" @click="$emit('forgot')">
                {{ $t('form.placeholder.forgot') }}
            </button>
        </div>

        <van-button type="danger" class="uppercase" native-type="submit">
            {{ $t('me.login') }}
        </van-button>
    </van-form>

    <div class="px-24 pt-24">
        <h2>{{ $t('account.instructions.title') }}</h2>
        <p class="text-12 text-#666 mt-8">{{ $t('account.instructions.desc') }}</p>
    </div>
</template>

<style lang="scss"></style>
