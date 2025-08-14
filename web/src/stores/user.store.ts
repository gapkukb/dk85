import { queryUserInfo } from '@/api'
import TokenManager from '@/shared/token-manager'
import loginUtil, { LoginType } from '@/utils/login'
import { defineStore } from 'pinia'
import { computed, ref, shallowReactive, shallowRef } from 'vue'

export const useUser = defineStore(
    'user',
    () => {
        const info = shallowRef<model.user.User>()
        const balance = ref(0)
        const authenticated = computed(() => !!TokenManager.accessToken.value)

        function updateUser() {
            
            if (!authenticated.value) return
            return queryUserInfo().then((_info) => {
                info.value = _info
                return _info
            })
        }

        function clearUser() {
            TokenManager.clear()
            info.value = undefined
        }

        return { info, authenticated, balance, clearUser, updateUser }
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
