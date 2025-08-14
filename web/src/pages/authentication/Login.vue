<script setup lang="ts">
import login, { LoginType } from '@/utils/login'
import { useAccountAction } from './useAccountAction'
import { ls } from '@/storage'
import { modals } from '@/modals'

const account = ref(ls.get(ls.keys.currentUser, ''))
const rememberMe = ref(false)
const { handler, key, timestamp } = useAccountAction(login,'登录成功')

function doLogin(values: any) {
    handler(values).then(() => {
        if (rememberMe.value) {
            ls.set(ls.keys.currentUser, account.value)
        }
        modals.authentication.close()
    })
}
</script>

<template>
    <van-form class="px-48 grid gap-32" @submit="doLogin">
        <AccountInput v-model="account" />

        <PasswordInput />

        <GraphicInput :key="key" v-model:timestamp="timestamp" />

        <div class="flex items-center justify-between py-32">
            <van-checkbox v-model="rememberMe" icon-size="16" checked-color="#ff5800" class="text-24">
                {{ $t('form.placeholder.remember') }}
            </van-checkbox>
            <button class="text-24 text-primary" @click="$emit('forgot')" type="button">
                {{ $t('form.placeholder.forgot') }}
            </button>
        </div>

        <van-button type="danger" class="uppercase" native-type="submit">
            {{ $t('me.login') }}
        </van-button>
    </van-form>

    <div class="px-48 pt-48">
        <h2>{{ $t('account.instructions.title') }}</h2>
        <p class="text-24 text-#666 mt-16">{{ $t('account.instructions.desc') }}</p>
    </div>
</template>

<style lang="scss"></style>
