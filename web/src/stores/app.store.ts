import { queryAppInfo } from '@/api/app.api'
import { defineStore } from 'pinia'
import { ref } from 'vue'

export const useApp = defineStore(
    'app',
    function () {
        const keepAlives = ref(new Set<string>())
        const unmuted = ref(true)
        const appInfo = ref<model.app.AppInfo>({} as any)

        return { keepAlives, unmuted, appInfo }
    },
    {
        persist: {
            omit: ['keepAlives'],
        },
    }
)
