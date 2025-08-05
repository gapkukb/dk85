<script setup lang="ts">
// import DashboardFooter from '../../layout/AppFooter.vue'
import type { SwipeInstance } from 'vant'
import HomeHeader from './HomeHeader.vue'
import { navs } from './navs'
import Announcement from '@/pages/announcement/index.vue'
import { useQuery } from '@tanstack/vue-query'
import db from '@/utils/db'
import { useApp } from '@/stores/app.store'

const app = useApp()
const swiper = ref<SwipeInstance>()
const active = ref(0)
const { isLoading, data: games } = useQuery({
    queryKey: ['allGame'],
    queryFn: () => db.all.queryGames(app.appInfo.version).catch(() => ({})),
})

function onchange(index: number) {
    active.value = index
}

function change(index: number) {
    onchange(index)
    swiper.value!.swipeTo(index)
}
</script>

<template>
    <HomeHeader
        :active="active"
        @change="change"
    />
    <van-swipe
        key="1"
        ref="swiper"
        id="home-page-swipe"
        lazy-render
        :loop="false"
        @change="onchange"
        :show-indicators="false"
    >
        <van-swipe-item v-for="(item, index) in navs">
            <component
                :is="item.component"
                :loading="isLoading"
                :games="games"
                :class="{ active: active === index }"
            />
        </van-swipe-item>
    </van-swipe>
    <!-- 公告弹窗 -->
    <!-- <Announcement /> -->
    <!-- 下载app -->
    <DownloadApp />
</template>

<style lang="scss">
.page-home {
    height: 100%;
    overflow-y: auto;
    padding: 0;
}

.home-view {
    width: 100%;
    position: absolute;
    left: 0;
    top: 0;
    right: 0;
    bottom: 0;
    overflow-y: hidden;
    --safe: 8px;
    padding-top: var(--app-padding-top);
    padding-bottom: var(--app-padding-bottom);
    padding-left: var(--safe);
    padding-right: var(--safe);
    align-content: flex-start;

    &.active {
        overflow-y: auto;
    }
}

#home-page-swipe {
    // position: absolute;
    // left: 0;
    // top: 0;
    // right: 0;
    // bottom: 0;
    height: 100dvh;
}

#tabnav .van-tabs__wrap {
    position: sticky;
    width: 100%;
    top: var(--h-nav-bar);
    z-index: 1;
}
</style>
