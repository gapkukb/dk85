<script setup lang="ts">
import ModalsView from '@/modals/views.vue'
import { useApp } from '@/stores/app.store'
import { useUser } from '@/stores/user.store'
import Splash from '../pages/splash/index.vue'

import { rpx } from '@/utils/rpx'
import AppFooter from './Footer.vue'

const route = useRoute()
const user = useUser()
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
        <router-view
            class="page-view"
            :class="pageName"
        />
    </div>
    <AppFooter v-if="$route.meta.footer" />

    <!-- 各类弹窗页面 -->
    <ModalsView />
    <!-- 背景音乐 -->
    <!-- <BGM /> -->
    <Splash />
</template>

<style lang="scss">
#app {
    --app-height-topbar: 80px;
    --app-height-navbar: 88px;
    --app-height-footer: 88px;
    --app-height-header: calc(var(--app-height-topbar) + var(--app-height-navbar));
    --app-padding-top: calc(var(--app-height-header) + 24px);
    --app-padding-bottom: calc(var(--app-height-footer) + 24px);
}

:where(.page-view) {
    padding: 24px;
}

:where(.page-footer) {
    padding-bottom: var(--app-padding-bottom);
}
</style>
