import type { useUser } from './stores/user.store'
import type { RouteRecordName, Router, RouteLocationRaw, RouteLocationAsRelativeGeneric, NavigationFailure } from 'vue-router'
import type zh from './locales/zh-CN'

type Join<K, P> = K extends string | number ? (P extends string | number ? `${K}${'' extends P ? '' : '.'}${P}` : never) : never

type Leaves<T, D extends number = 10> = [D] extends [never] ? never : T extends object ? { [K in keyof T]-?: Join<K, Leaves<T[K], Prev[D]>> }[keyof T] : ''

type Named = (this: Router, to: string | RouteLocationAsRelativeGeneric) => Promise<NavigationFailure | void | undefined>
declare module 'vue-router' {
    interface RouteMeta {
        requiredAuth?: boolean
        title?: Leaves<typeof zh>
        keywords?: string
        description?: string
        footer?: true
    }

    interface Router {
        pushNamed: Named
        replaceNamed: Named
    }
}

declare module 'vue' {
    interface ComponentCustomProperties {
        $store: {
            user: ReturnType<typeof useUser>
        }
    }
}

/**
 * you need to import the some interfaces
 */

declare module 'vue-i18n' {
    type A = typeof zh
    // define the locale messages schema
    export interface DefineLocaleMessage extends A {}

    // define the datetime format schema
    export interface DefineDateTimeFormat {
        short: {
            hour: 'numeric'
            minute: 'numeric'
            second: 'numeric'
            timeZoneName: 'short'
            timezone: string
        }
    }

    // define the number format schema
    export interface DefineNumberFormat {
        currency: {
            style: 'currency'
            currencyDisplay: 'symbol'
            currency: string
        }
    }
}
