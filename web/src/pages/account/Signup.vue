<script setup lang="ts">
const account = ref('')
const password = ref('')
const repassword = ref('')
const phone = ref('')
</script>

<template>
    <van-form class="px-24 grid gap-16">
        <AccountInput v-model="account" />

        <PasswordInput v-model="password" />

        <PasswordInput
            v-model="repassword"
            :password="password"
            is-repeat
        />

        <PhoneNumberInput v-model="phone" />

        <van-button
            type="danger"
            class="uppercase"
        >
            {{ $t('login2') }}
        </van-button>
    </van-form>
</template>

<style lang="scss"></style>
