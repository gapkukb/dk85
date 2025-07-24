//@ts-ignore
import nprogress from 'nprogress'
import hotIcon from './assets/icons/home-nav-hot.svg?url'
import casinoIcon from './assets/icons/home-nav-casino.svg?url'
import slotIcon from './assets/icons/home-nav-slots.svg?url'
import pokerIcon from './assets/icons/home-nav-poker.svg?url'
import finshingIcon from './assets/icons/home-nav-fishing.svg?url'
import type { AsyncComponentLoader } from 'vue'

const Foru = AsyncComponent(() => import('@/pages/foru/index.vue'))
const Slots = AsyncComponent(() => import('@/pages/slots/index.vue'))
const Fishing = AsyncComponent(() => import('@/pages/fishing/index.vue'))
const Poker = AsyncComponent(() => import('@/pages/poker/index.vue'))
const Casino = defineAsyncComponent(() => import('@/pages/casino/index.vue'))

export const navs = [
    { name: t('home.foru'), icon: hotIcon, id: 1, component: Foru },
    { name: t('home.slot'), icon: slotIcon, id: 2, component: Slots },
    { name: t('home.fishing'), icon: finshingIcon, id: 3, component: Fishing },
    { name: t('home.poker'), icon: pokerIcon, activeIcon: pokerIcon, id: 4, component: Poker },
    { name: t('home.casino'), icon: casinoIcon, id: 5, component: Casino },
]

function AsyncComponent(loader: AsyncComponentLoader<any>) {
    return defineAsyncComponent(() => {
        nprogress.start()
        return loader().finally(() => nprogress.remove())
    })
}
