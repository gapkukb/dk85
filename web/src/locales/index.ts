import { createI18n, type I18n } from 'vue-i18n'
import Locales, { type Locale } from './Locales'

export const i18n = createI18n({
    locale: Locales.current.code,
    fallbackLocale: Locales.en.code,
})

export const locale = ref(Locales.current.code)

export async function setLocale(current: Locale | string) {
    const code = Locales.setLocale(current).code
    i18n.global.locale = code
    locale.value = code
    const messages = await import(/* webpackChunkName: "locale-[request]" */ `./${code}/index.ts`)
    i18n.global.setLocaleMessage(code, messages.default)

    document.documentElement.setAttribute('lang', code)
}

export function useLocale() {
    return {
        locale,
        setLocale,
        supported: Locales.supported,
        localeName: Locales.current.localeName,
    }
}

export const t = i18n.global.t.bind(i18n.global)
