<script setup lang="ts">
import Modal from '@/modals/Modal'
import { useApp } from '@/stores/app.store'
import { useUser } from '@/stores/user.store'

import { rpx } from '@/utils/rpx'
import AppFooter from './Footer.vue'

const route = useRoute()
const user = useUser()
const pageName = computed(() => {
    const classes = route.matched.filter((i) => i.name && typeof i.name === 'string').map((i) => `page-${(i.name as string).toLowerCase()}`)
    if (route.meta.footer) {
        classes.push("page-footer")
    }
    return classes
})
</script>

<template>
    <div :key="`${user.authenticated}`" class="page-view" :class="pageName">
        <router-view class="page-view" :class="pageName" />
    </div>
    <AppFooter v-if="$route.meta.footer" />

   
    <!-- 各类弹窗页面 -->
    <Modal />
    <!-- 背景音乐 -->
    <!-- <BGM /> -->


</template>


<style lang="scss">
#app {
    --app-height-topbar: 40px;
    --app-height-navbar: 44px;
    --app-height-footer: 44px;
    --app-height-header: calc(var(--app-height-topbar) + var(--app-height-navbar));
    --app-padding-top: calc(var(--app-height-header) + 8px);
    --app-padding-bottom: calc(var(--app-height-footer) + 8px);
}

:where(.page-view) {
    padding: 8px;
}

:where(.page-footer) {
    padding-bottom: var(--app-padding-bottom);
}
</style>