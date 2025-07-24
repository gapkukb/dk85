<script setup lang="ts">
const value = ref('')
</script>

<template>
    <div class="grid px-12 pt-48">
        <p class="text-12">请提供您的账号/邮件/或手机号码</p>
        <van-field v-model="value" placeholder="Phone number/Email" autocomplete="off"></van-field>
        <div class="h-24"></div>
        <van-button color="#ff5800" block :disabled="!value">下一步</van-button>
    </div>
</template>

<style lang="scss"></style>
