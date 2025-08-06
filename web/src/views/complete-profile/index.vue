<script setup lang="ts">
import { bindEmail, bindMobileNumber } from '@/api/user.api';
import { modals } from '@/modals';
import { useUser } from '@/stores/user.store';
import { showSuccessToast } from 'vant';

function bind(values: any) {
    const tasks: any[] = [bindMobileNumber({ mobile: '95' + values.mobile })];

    if (values.email) {
        tasks.push(bindEmail({ email: values.email }))
    }
    Promise.all(tasks).then(() => {
        showSuccessToast({})
        modals.completeProfile.close()
        useUser().updateUser()
    })
}
</script>

<template>
    <van-form class="grid gap-48 p-24" @submit="bind">
        <h1 class="fs-28 font-bold text-center">完善个人资料</h1>
        <div>
            <h6 class="fs-24 c-#999">手机号码</h6>
            <mobile-number-input />
        </div>

        <div class="">
            <h6 class="fs-24 c-#999">邮箱（可选）</h6>
            <email-input :required="false" />
        </div>
        <div></div>
        <van-button native-type="submit" type="danger">完成并领取最高58MMK福利</van-button>
        <div></div>
    </van-form>

    <teleport to="body">
        <button class="absolute top-50% left-50% translate-x--1/2 mt-50vw  bg-white rd-full size-72" type="button"
            @click="modals.completeProfile.close">
            <van-icon name="cross" color="black" />
        </button>
    </teleport>
</template>

<style lang="scss"></style>