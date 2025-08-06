import { queryAppInfo } from '@/api/app.api'
import { defineStore } from 'pinia'
import { ref } from 'vue'

const _keepAlives = new Set<string>()

export const useApp = defineStore(
    'app',
    function () {
        const keepAlives = ref<string[]>([])
        const unmuted = ref(true)
        const appInfo = ref<model.app.AppInfo>({} as any)

        return { keepAlives, cachedViews: keepAlives, unmuted, appInfo }
    },
    {
        persist: {
            omit: ['keepAlives'],
        },
    }
)
