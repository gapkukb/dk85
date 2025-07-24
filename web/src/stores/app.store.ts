import { defineStore } from 'pinia'
import { ref } from 'vue'

export const useApp = defineStore(
    'app',
    function () {
        const keepAlives = ref(new Set<string>())
        const unmuted = ref(true)

        return { keepAlives, unmuted }
    },
    {
        persist: {
            omit: ['keepAlives'],
        },
    }
)
