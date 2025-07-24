<script setup lang="ts">
import { ref } from 'vue'

const show = ref(false)
const agreement = ref(true)
const codeType = ref(true)
nextTick(() => (show.value = true))
</script>

<template>
    <van-popup v-model:show="show" position="right" closeable close-icon="close" class="size-full">
        <img src="https://arenaplus.net/cdn/C66FM/static/image/nba-bg.6362a900.jpeg" alt="" />
        <van-form class="px-12">
            <template v-if="codeType">
                <van-field label="Phone" placeholder="09xx xxx xxxx" autocomplete="off" />
                <div class="h-24"></div>
                <van-button block color="#ff5800">获取验证码</van-button>
            </template>
            <template v-else>
                <van-field label="Username" placeholder="Account/phone number/Email" autocomplete="off" />
                <div class="h-8"></div>
                <van-field label="Password" placeholder="User Name" autocomplete="off" />
                <div class="h-8"></div>
                <div class="text-right">
                    <router-link to="/recover" class="text-right text-12 text-blue">忘记密码?</router-link>
                </div>
                <div class="h-24"></div>
                <van-button block color="#ff5800">登录/注册</van-button>
            </template>

            <div class="h-8"></div>
            <van-button block color="#ff5800" plain @click="codeType = !codeType">{{ codeType ? '密码登录' : '验证码登录' }}</van-button>

            <van-divider>OR</van-divider>
            <div class="flex justify-around text-18">
                <button><i-devicon:apple /></button>
                <button><i-devicon:google /></button>
                <button><i-devicon:facebook /></button>
                <button><i-skill-icons:instagram /></button>
            </div>
            <div class="h-48"></div>
            <van-checkbox v-model="agreement" shape="square" class="justify-center">我已阅读并同意<span>《用户协议》</span><span>《隐私协议》</span></van-checkbox>
        </van-form>
    </van-popup>
</template>

<style lang="scss" scoped></style>
