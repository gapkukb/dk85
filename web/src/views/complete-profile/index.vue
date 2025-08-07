<script setup lang="ts">
import { bindEmail, bindMobileNumber } from '@/api/user.api'
import { modals } from '@/modals'
import { useUser } from '@/stores/user.store'
import { showSuccessToast } from 'vant'

function bind(values: any) {
    const tasks: any[] = [bindMobileNumber({ mobile: '95' + values.mobile })]

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
    <van-form
        class="grid gap-48 px-24 py-48 bg-white rd-24 overflow-auto"
        @submit="bind"
    >
        <div>
            <h6 class="fs-24 c-#999 pb-24">手机号码</h6>
            <mobile-number-input />
        </div>

        <div class="">
            <h6 class="fs-24 c-#999 pb-24">邮箱（可选）</h6>
            <email-input :required="false" />
        </div>
        <van-button
            native-type="submit"
            type="danger"
        >
            完成并领取最高58MMK福利
        </van-button>
    </van-form>
</template>

<style lang="scss"></style>
