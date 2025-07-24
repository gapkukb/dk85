import type { PopupProps } from 'vant'
import { defineAsyncComponent, type AsyncComponentLoader, type Component, type DefineComponent, type ExtractPropTypes } from 'vue'
import { ModalsName } from '.'

function create<T extends Component>(name: ModalsName, loader: AsyncComponentLoader<T>) {
    return {
        component: defineAsyncComponent<T>(loader),
        name,
    }
}

export default [
    create(ModalsName.guidelines, () => import('@/pages/guidelines/index.vue', {})),
    create(ModalsName.login, () => import('@/pages/account/index.vue')),
    create(ModalsName.otp, () => import('@/pages/otp/index.vue')),
    create(ModalsName.terms, () => import('@/pages/terms/index.vue')),
    create(ModalsName.captcha, () => import('@/pages/puzzle-captcha/index.vue')),
    create(ModalsName.locale, () => import('@/pages/locale/index.vue')),
    create(ModalsName.cs, () => import('@/pages/cs/index.vue')),
] as const
