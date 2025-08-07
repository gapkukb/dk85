<script setup lang="ts">
import ModalsView from '@/modals/views.vue'
import { useApp } from '@/stores/app.store'
import { useUser } from '@/stores/user.store'
import Splash from '../pages/splash/index.vue'
import Announcement from '../pages/announcement/index.vue'
import AppFooter from './Footer.vue'

const route = useRoute()
const user = useUser()
const app = useApp()
const pageName = computed(() => {
    const classes = route.matched.filter((i) => i.name && typeof i.name === 'string').map((i) => `page-${(i.name as string).toLowerCase()}`)
    if (route.meta.footer) {
        classes.push('page-footer')
    }
    return classes
})
</script>

<template>
    <div
        :key="`${user.authenticated}`"
        class="page-view"
        :class="pageName"
    >
        <router-view v-slot="{ Component }">
            <keep-alive>
                <component
                    :is="Component"
                    class="page-view"
                    :class="pageName"
                />
            </keep-alive>
        </router-view>
    </div>
    <AppFooter v-if="$route.meta.footer" />
    <!-- 公告弹窗 -->
    <Announcement />
    <!-- 各类弹窗页面 -->
    <ModalsView />
    <!-- 背景音乐 -->
    <!-- <BGM /> -->
    <!-- <Splash /> -->
    <!-- <NewbieGuide @closed="onClosed" /> -->
</template>

<style lang="scss">
#app {
    // --app-height-topbar: 104px;
    // --app-height-navbar: 100px;
    --app-height-footer: 88px;
    // --app-height-header: calc(var(--app-height-topbar) + var(--app-height-navbar));
    // --app-padding-top: calc(var(--app-height-header) + 24px);
    --app-padding-bottom: calc(var(--app-height-footer) + 24px);
}

:where(.page-view) {
    padding-left: 24px;
    padding-right: 24px;
}

:where(.page-footer) {
    padding-bottom: var(--app-padding-bottom);
}
</style>
