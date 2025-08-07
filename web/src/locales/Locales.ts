import { ls } from '@/storage'
import { showLoadingToast, Locale as VantLocale } from 'vant'
import type { ToastWrapperInstance } from 'vant/es'
import enUS from 'vant/es/locale/lang/en-US'
import kmKH from 'vant/es/locale/lang/km-KH'
import myMM from 'vant/es/locale/lang/mm-MN'
import filPH from 'vant/es/locale/lang/zh-CN'
class Locale {
    declare code: string

    constructor(public lang: string, public country: string, public localeName: string, public areaCode: string) {
        this.code = lang + '-' + country
    }

    looseEquals(code: string) {
        return this.code === code || this.lang === code || this.country === code
    }
}

export type { Locale }

export default abstract class Locales {
    static readonly my = new Locale('my', 'MM', 'မြန်မာစာ', '+85')
    // 高棉语 - 柬埔寨
    static readonly km = new Locale('km', 'KH', 'ខេមរភាសា', '+95')
    static readonly zh = new Locale('zh', 'CN', '简体中文', '+86')
    static readonly en = new Locale('en', 'US', 'English', '+1')
    // 他加祿語 - 菲律
    static readonly tl = new Locale('fil', 'PH', 'Filipino', '+63')

    static readonly supported: Locale[] = [this.my, this.km, this.en, this.zh, this.tl]
    // 默认偏好
    static readonly prefer: string = import.meta.env.DEV ? this.zh.code : this.km.code

    static getLocale(code: string) {
        return this.supported.find((i) => i.looseEquals(code))
    }

    static setLocale(code: string, set: Function) {
        return new Promise<void>((resolve, reject) => {
            // 先从本地缓存取
            let loading: ToastWrapperInstance | null = null
            let translation: any = ls.get(code)
            if (translation) {
                set(code, translation)
                resolve()
            } else {
                loading = showLoadingToast({ overlay: true })
            }
            this.#setVantLocale(code)
            // 再同步远端，更新缓存，并重新放入内存
            import(/* webpackChunkName: "locale-[request]" */ `./${code}/index.ts`)
                .then((module) => {
                    translation = module.default
                    ls.set(code, translation)
                    set(code, translation)
                    resolve()
                })
                .catch(reject)
                .finally(loading?.close)
        })
    }

    static #setVantLocale(code: string) {
        const translation = {
            enUS,
            kmKH,
            myMM,
            filPH,
        }[code]

        VantLocale.use(code, translation)
    }
}
