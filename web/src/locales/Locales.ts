import { Locale as VantLocale } from 'vant'
import enUS from 'vant/es/locale/lang/en-US'
import kmKH from 'vant/es/locale/lang/km-KH'
import { ls } from '@/utils/storage'

class Locale {
    declare code: string

    constructor(public lang: string, public country: string, public localeName: string) {
        this.code = lang + '-' + country
    }

    looseEquals(code:string){
        return this.code === code||this.lang===code||this.country === code;
    }
}

export type { Locale }

export default abstract class Locales {
    static {}
    // 高棉语 - 柬埔寨
    static readonly zh = new Locale('zh', 'CN', '简体中文')
    static readonly en = new Locale('en', 'US', 'English')
    static readonly km = new Locale('km', 'KH', 'မြန်မာ')
    // 他加祿語 - 菲律
    static readonly tl = new Locale('tl', 'PH', 'Tagalog')

    static readonly supported: Locale[] = [this.km, this.en, this.zh, this.tl]
    // 默认偏好
    static readonly #default: string = import.meta.env.DEV ? this.zh.code : this.km.code

    static #current: Locale

    static getLocale(code: string) {
        return this.supported.find((i) => i.looseEquals(code))
    }

    static get current() {
        if (this.#current) return this.#current
        //当前语言，优先从缓存里取
        const code = ls.get(ls.keys.locale, this.#browser || this.#default)
        this.#current = this.getLocale(code)!
        return this.#current
    }

    static setLocale(locale: Locale | string) {
        let current = this.current

        if ((typeof locale === 'string' && locale === current.code) || (typeof locale === 'object' && locale.code === current.code)) {
            if (ls.get(ls.keys.locale)) {
                return current
            }
        }

        if (typeof locale === 'string') {
            current = this.getLocale(locale)!
        } else {
            current = locale
        }

        ls.set(ls.keys.locale, current.code)
        this.#setVantLocale(current)
        this.#current = current
        
        return current
    }

    static #setVantLocale(locale: Locale) {
        const translation = {
            en: enUS,
            km: kmKH,
        }[locale.lang]

        VantLocale.use(locale.code, translation || enUS)
    }

    static get #browser() {
        return this.zh.code
        // window.navigator.languages  --->  ['en-US', 'en', 'zh-CN']
        return window.navigator.languages.find((i) => this.supported.find((j) => j.code === i || j.lang === i))
    }
}
