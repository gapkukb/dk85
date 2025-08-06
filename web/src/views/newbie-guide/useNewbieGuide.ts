import { useLs } from '@/composables'
import { ls } from '@/utils/storage'

export function useNewbieGuide() {
    const showGuide = useLs(ls.keys.newbieGuide, true)
    const NewbieGuide = defineAsyncComponent(async () => {
        if (!showGuide.value) return null as any;
        await Promise.delay(4000)
        return import('./index.vue')
    })

    function onClosed() {
        showGuide.value = false
    }

    return { NewbieGuide, onClosed }
}
