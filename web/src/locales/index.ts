import { createI18n } from 'vue-i18n'
import Locales from './Locales'
import { useLs } from '@/storage'
//当前语言，优先从缓存里取

const _locale = ref(Locales.current)

const localeName = computed(() => Locales.getLocale(_locale.value)!.localeName)

async function setLocale(code: string) {
    await Locales.setLocale(code, i18n.global.setLocaleMessage)
    _locale.value = code
    i18n.global.locale = code
    document.documentElement.setAttribute('lang', code)
}

export const i18n = createI18n({
    locale: _locale.value,
    fallbackLocale: Locales.prefer,
})

export const locale = computed({
    get() {
        return _locale.value
    },
    async set(code: string) {
        if (code === _locale.value) return
        setLocale(code)
    },
})

export function useLocale() {
    return {
        locale,
        supported: Locales.supported,
        localeName: localeName,
        setLocale,
    }
}

export const t = i18n.global.t.bind(i18n.global)

export function setupLocale() {
    return setLocale(_locale.value)
}
