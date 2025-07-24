import { createI18n, type I18n } from 'vue-i18n'
import { ls } from '@/utils/storage'
import { Locale as Vant } from 'vant'
import enUS from 'vant/es/locale/lang/en-US'
import kmKH from 'vant/es/locale/lang/km-KH'
import { useLs } from '@/composables'

Vant.use('en-US', enUS)

export enum Locales {
    en = 'en',
    km = 'km',
}

export const localesList = [Locales.en, Locales.km] as const

const defaultLocale = import.meta.env.DEV ? Locales.en : Locales.km

const locale = useLs(ls.keys.locale, defaultLocale)

export const i18n = createI18n({
    locale: locale.value,
    fallbackLocale: Locales.km,
})

export async function setLocale(current: Locales) {
    i18n.global.locale = current
    locale.value = current
    const messages = await import(/* webpackChunkName: "locale-[request]" */ `./messages/${current}.json`)
    i18n.global.setLocaleMessage(current, messages.default)

    setVantLocale(current)
    document.documentElement.setAttribute('lang', current)
}

export function initializeLocale() {
    return setLocale(locale.value)
}

export function useLocale() {
    const locales = [
        { code: Locales.km, label: 'မြန်မာ' },
        { code: Locales.en, label: 'English' },
    ]
    const localeName = computed(() => locales.find((i) => i.code === locale.value)!.label)

    return {
        locale,
        localeName,
        locales,
        setLocale,
    }
}

function setVantLocale(locale: Locales) {
    const lang = {
        [Locales.en]: enUS,
        [Locales.km]: kmKH,
    }[locale]

    Vant.use(locale, lang)
}

export function t(key:string){
    return i18n.global.t(key)
}