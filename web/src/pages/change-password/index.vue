<script setup lang="ts">
const successful = ref(false)
const older = ref('')
const newer = ref('')
const renewer = ref('')
const onSubmit = (values: any) => {
    console.log('submit', values)
}

const regexp = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]).{8,16}$/

function validatePassword(value: string) {
    return regexp.test(value)
}
const rule = { validator: validatePassword, message: 'Password must be 8–16 characters and include uppercase, lowercase, number, and special symbol.' }
const rule2 = {
    validator(value: string) {
        return value === newer.value
    },
    message: 'Repeat new password must equals to new password',
}
const showPopover = ref(false)
const actions = [{ text: 'Option 1' }, { text: 'Option 2' }, { text: 'Option 3' }]

function change() {
    successful.value = true
}
</script>

<template>
    <div v-if="successful" class="grid px-12 pt-48 place-items-center">
        <i-qlementine-icons:success-32 class="text-56 text-green" />
        <h3 class="text-18 font-semibold mt-16">Password changed!</h3>
        <p class="text-12 text-#8286a3 mt-8">Your password has been changed successfully</p>
        <div class="h-32"></div>
        <van-button color="#ff5800" block>Back To Home Page</van-button>
    </div>
    <van-form v-else class="px-12 pt-48" @submit="onSubmit" validate-trigger="onChange">
        <!-- <div class="relative">
                <van-field
                    v-model="older"
                    name="old"
                    maxlength="16"
                    placeholder="旧密码"
                    autocomplete="off"
                    :rules="[rule]"
                    class="password-field"
                    @focus="showPopover = true"
                    @blur="showPopover = false"
                >
                </van-field>
                <div class="absolute left-0 right-0 z-1 bg-white top-100%" v-show="showPopover">
                    <van-checkbox :model-value="older.length>8" icon-size="12">8–16 characters and include uppercase</van-checkbox>
                    <van-checkbox :model-value="older.includes()" icon-size="12">include uppercase</van-checkbox>
                    <van-checkbox icon-size="12">include uppercase</van-checkbox>
                    <van-checkbox icon-size="12">special symbol.</van-checkbox>
                </div>
            </div> -->
        <van-field v-model="older" name="old" maxlength="16" placeholder="旧密码" autocomplete="off" :rules="[rule]"></van-field>
        <van-field v-model="newer" name="new" maxlength="16" placeholder="新密码" autocomplete="off" type="password" :rules="[rule]" />
        <van-field v-model="renewer" name="renew" maxlength="16" placeholder="再次输入新密码" autocomplete="off" type="password" :rules="[rule2]" />
        <div class="h-24"></div>
        <van-button color="#ff5800" native-type="submit" block :disabled="!older" @click="change">Confirm</van-button>
    </van-form>
</template>

<style lang="scss">
.password-field {
    .van-field__error-message {
        position: absolute;
        z-index: 2;
    }
}
</style>
