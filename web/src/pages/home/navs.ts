//@ts-ignore
import nprogress from 'nprogress'
import type { AsyncComponentLoader, Component } from 'vue'

const icons = import.meta.glob<string>('./*.webp', { base: './assets', eager: true, import: 'default' })
const Foru = AsyncComponent(() => import('@/pages/foru/index.vue'))
const Slots = AsyncComponent(() => import('@/pages/slots/index.vue'))
const Fishing = AsyncComponent(() => import('@/pages/fishing/index.vue'))
const Poker = AsyncComponent(() => import('@/pages/poker/index.vue'))
// const Casino = defineAsyncComponent(() => import('@/pages/casino/index.vue'))

export const navs = [
    { name: t('home.foru'), icon: icons['./hot.webp'], id: 1, component: Foru },
    { name: t('home.slot'), icon: icons['./slots.webp'], id: 2, component: Slots },
    { name: t('home.fishing'), icon: icons['./fishing.webp'], id: 3, component: Fishing },
    { name: t('home.poker'), icon: icons['./pocker.webp'], id: 4, component: Poker },
    // { name: t('home.casino'), icon: casinoIcon, id: 5, component: Casino },
]

function AsyncComponent(loader: AsyncComponentLoader<any>) {
    return defineAsyncComponent(() => {
        nprogress.start()
        return loader().finally(() => nprogress.remove())
    })
}
