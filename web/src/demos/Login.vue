<script setup lang="ts">
import { testProtected, testRefresh } from '@/api/app.api';
import login from '@/utils/login';


const a =()=> login().then(() => console.log('登录成功'))
const b =()=> testProtected().then((rs) => console.log(rs))
const c =()=> testRefresh().then(() => console.log('刷新成功'))


</script>

<template>
    <div>
        <van-button @click="a">登录</van-button>
        <van-button @click="b">受保护接口</van-button>
        <van-button @click="c">刷新</van-button>
    </div>
</template>

<style lang="scss" scoped></style>