import { queryUserInfo } from '@/api/user.api'
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
                updateToken(value.token)
                refreshToken.value = value.refreshToken
            } else {
                clearUser()
            }
        }

        function updateUser() {
            if (!authenticated.value) return
            return queryUserInfo().then((_info) => {
                info.value = _info
                return _info
            })
        }

        function clearUser() {
            token.value = ''
            refreshToken.value = ''
            info.value = undefined
        }

        function updateToken(value?: string) {
            token.value = value ? 'Bearer ' + value : ''
        }

        return { info, authenticated, token, refreshToken, balance, updateToken, setUser, clearUser, updateUser }
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
        persist: {
            afterHydrate(context) {
                context.options.actions.updateUser()
            },
        },
    }
)
