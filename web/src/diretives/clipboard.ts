import type { FunctionDirective } from 'vue'
import { showToast } from 'vant'
import { useClipboard } from '@vueuse/core'

export default <FunctionDirective<Element, string | number | undefined>>function clipboard(el, { value }) {
    el.addEventListener('click', async (e) => {
        const { copy, copied } = useClipboard({ legacy: true })
        if (value === null || value === undefined) return
        await copy('' + value)
        copied.value && showToast(t('app.copy'))
    })
}
