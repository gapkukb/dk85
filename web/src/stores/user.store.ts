import loginUtil, { LoginType } from '@/utils/login'
import { defineStore } from 'pinia'
import { computed, ref, shallowReactive, shallowRef } from 'vue'

export const useUser = defineStore(
    'user',
    () => {
        const info = shallowRef<model.user.User>()
        const balance = ref(0)
        const authenticated = computed(() => !!info.value?.loginName)
        const token = ref('')
        const webToken = ref('')

        function setInfo(value: any) {
            info.value = value
        }

        async function login(loginType: LoginType, payload?: any) {
            const result = await loginUtil(loginType, payload)
            token.value = result.token
            setInfo(result.user)
            return true
        }
        function logout() {
            alert('正在退出登录')
        }

        return { info, authenticated, setInfo, token, webToken, login, logout, balance }
    }
    // {
    //   persist: {
    //     afterHydrate(context) {
    //       console.log(context);
    //       if (context.store.user) {
    //         context.store.user = new UserModel(context.store.user);
    //       }
    //     },
    //   },
    // }
)
