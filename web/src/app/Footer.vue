<script setup lang="ts">
import MdiLightGift from '~icons/mdi-light/gift'
// import ArcticonsPoker from '~icons/arcticons/poker'
import ArcticonsPoker from '@/assets/icons/bottom-nav-home.svg?component'
import Iconoirfunds from '~icons/iconoir/wallet'
import HugeiconsFire from '~icons/hugeicons/fire'
import GuidanceUser1 from '~icons/guidance/user-1'
import { useI18n } from 'vue-i18n'
const { t } = useI18n()
const navs = [
    { name: t('app.home'), icon: ArcticonsPoker, id: 1, routePath: '/' },
    { name: t('app.promos'), icon: MdiLightGift, id: 2, routePath: '/promos' },
    { name: t('app.funds'), icon: Iconoirfunds, id: 3, routePath: '/funds' },
    // { name: t('hot'), icon: HugeiconsFire, id: 4, routePath: '/hot' },
    { name: t('app.me'), icon: GuidanceUser1, id: 4, routePath: '/me' },
]
</script>

<template>
    <footer class="footer">
        <router-link
            v-for="nav in navs"
            :key="nav.name"
            :to="nav.routePath"
            tag="button"
            class="footer-nav"
            :id="`guide-${nav.id}`"
        >
            <img
                v-if="nav.id === 1"
                src="/logo.webp"
                class="size-64"
            />
            <template v-else>
                <component
                    :is="nav.icon"
                    class="fs-32"
                />
                <span class="text-20">
                    {{ nav.name }}
                </span>
            </template>
        </router-link>
    </footer>
</template>

<style lang="scss">
.footer {
    @apply fixed flex bottom-0 left-0 right-0 bg-white bg-op-98 justify-around z-1;
    height: var(--app-height-footer);
    border-top: 1px solid #eee;
}

.footer-nav {
    @apply inline-grid place-items-center place-content-center flex-1 gap-4;
    &.router-link-active {
        color: #ff5800;
    }
}
</style>
