<script setup lang="ts">
import DashboardActions from './HomeHeaderActions.vue'
import HomeHeaderAccount from './HomeHeaderAccount.vue'
import { navs } from './navs'

defineProps<{ active: number }>()
defineEmits<{ change: [number] }>()

</script>

<template>
    <header class="home-header">
        <div class="home-topbar">
            <HomeHeaderAccount />
            <DashboardActions />
        </div>

        <nav class="home-nav-bar">
            <div v-for="(item, index) in navs" :key="item.id" class="home-nav-item" @click="$emit('change', index)">
                <img :src="item.icon" class="size-56" />
                <h6 class="home-nav-item-text" :class="{ on: index === active }">
                    {{ item.name }}
                </h6>
            </div>
        </nav>
    </header>

</template>

<style lang="scss">
.home-header {
    @apply fixed top-0 left-0 right-0 z-1 bg-op-99 bg-#eef2f5;
}

.home-topbar {
    @apply flex justify-between items-center px-24 pt-12;
}

.home-nav-bar {
    @apply flex justify-between items-center px-24 gap-16 py-8;
    height: var(--app-height-navbar)
}

.home-nav-item {
    @apply flex-1 inline-grid place-items-center gap-6 relative;

    .home-nav-item-text {
        @apply font-semibold text-20 lh-none py-2 px-8 rd-4;

        &.on {
            @apply bg-primary c-white;
        }
    }
}
</style>
