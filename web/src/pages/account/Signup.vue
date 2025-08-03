<script setup lang="ts">
import { register } from '@/api/user.api'
import { Modals, ModalsName } from '@/modals'
import { useUser } from '@/stores/user.store'
import { showLoadingToast, showSuccessToast, showToast } from 'vant'


const user = useUser()
const password = ref('')
const time = ref(Date.now())
const key = ref(1000)
const router = useRouter()

function signup(form: any) {
    form.time = document.getElementById('timestamp')?.dataset.timestamp;
    register(form).then(async (rs) => {
        user.updateToken(rs.token)
        await user.updateUser();
        showSuccessToast('注册成功')
        router.replace('/')
        Modals.close(ModalsName.login);
    }).catch(() => key.value++)
}

</script>

<template>
    <van-form class="px-24 grid gap-16" @submit="signup">
        <AccountInput />

        <PasswordInput v-model="password" />

        <PasswordInput :password="password" is-repeat />

        <PhoneNumberInput />

        <GraphicInput :key="key" v-model:time="time" />
        <div class="h-16"></div>
        <van-button type="danger" class="uppercase" native-type="submit">
            {{ $t("me.signup") }}
        </van-button>
    </van-form>
</template>

<style lang="scss"></style>
