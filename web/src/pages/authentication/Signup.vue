<script setup lang="ts">
import { register } from '@/api/user.api'
import { Modals, ModalsName } from '@/modals'
import { useUser } from '@/stores/user.store'
import { showLoadingToast, showSuccessToast, showToast } from 'vant'
import { useAccountAction } from './useAccountAction'


const password = ref('')

const { handler, key, timestamp } = useAccountAction(register, '注册成功')


</script>

<template>
    <van-form class="px-24 grid gap-16" @submit="handler">
        <AccountInput />

        <PasswordInput v-model="password" />

        <PasswordInput :password="password" is-repeat />

        <PhoneNumberInput />

        <GraphicInput :key="key" v-model:timestamp="timestamp" />
        <div class="h-16"></div>
        <van-button type="danger" class="uppercase" native-type="submit">
            {{ $t("me.signup") }}
        </van-button>
    </van-form>
</template>

<style lang="scss"></style>
