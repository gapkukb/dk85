import loginUtil, { LoginType } from '@/utils/login'
import { defineStore } from 'pinia'
import { computed, ref, shallowReactive, shallowRef } from 'vue'

export const useUser = defineStore(
    'user',
    () => {
        const info = shallowRef<model.user.User>()
        const token = ref('')
        const refreshToken = ref('')
        const balance = ref(0)
        const authenticated = computed(() => !!token.value)

        function setUser(value: model.user.vo.Login | Nullish) {
            if (value) {
                info.value = value.user
                token.value = value.token
                refreshToken.value = value.refreshToken
            } else {
                clearUser()
            }
        }

        function clearUser() {
            token.value = ''
            refreshToken.value = ''
            info.value = undefined
        }

        return { info, authenticated, setUser, clearUser, token, refreshToken, balance }
    },
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

    {
        persist: {},
    }
)
