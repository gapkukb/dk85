<script setup lang="ts">
import { Modals, ModalsName } from '@/modals'
import { useUser } from '@/stores/user.store'
import { LoginType } from '@/utils/login'
import { ls } from '@/utils/storage'

const user = useUser()
const account = ref(ls.get(ls.keys.currentUser, ''))
const password = ref('')
const code = ref('')
const rememberMe = ref(false)

async function doLogin(values: any) {
    await user.login(LoginType.Account, values)
    Modals.close(ModalsName.login)
    if (rememberMe.value) {
        ls.set(ls.keys.currentUser, account.value)
    }
}
</script>

<template>
    <van-form class="px-24 grid gap-16" @submit="doLogin">
        <AccountInput v-model="account" />

        <PasswordInput v-model="password" />

        <GraphicInput v-model="code" />

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
