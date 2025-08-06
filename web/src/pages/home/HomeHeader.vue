<script setup lang="ts">
import { useUser } from '@/stores/user.store'
import { modals } from '@/modals'
import DashboardActions from './HomeHeaderActions.vue'
import HomeHeaderAccount from './HomeHeaderAccount.vue'
import { navs } from './navs'

defineProps<{ active: number }>()
defineEmits<{ change: [number] }>()
const user = useUser()
</script>

<template>
    <header class="home-header">
        <div class="home-topbar">
            <HomeHeaderAccount v-if="user.authenticated" />
            <van-button
                v-else
                round
                type="danger"
                size="small"
                class="min-w-1=200"
                @click="modals.authentication.open"
            >
                {{ $t('me.login') }} | {{ $t('me.signup') }}
            </van-button>

            <DashboardActions />
        </div>

        <nav class="home-nav-bar">
            <div
                v-for="(item, index) in navs"
                :key="item.id"
                class="home-nav-item"
                :class="{ on: index === active }"
                @click="$emit('change', index)"
            >
                <img
                    :src="item.icon"
                    class="size-40"
                />
                <span class="text-24 lh-24">{{ item.name }}</span>
            </div>
        </nav>
    </header>

    <!-- <div class="van-hairline--bottom h-1"></div> -->
</template>

<style lang="scss">
.home-header {
    @apply fixed top-0 left-0 right-0 z-1 bg-white bg-op-98;
    // height: var(--h-header)
}

.home-topbar {
    @apply flex justify-between items-center h-80 px-24 py-16;
    height: var(--h-topbar);
}

.home-nav-bar {
    @apply flex justify-between items-center px-24 pb-16 gap-16;
    height: var(--h-navbar);
}

.home-nav-item {
    @apply flex-1 inline-grid place-items-center gap-8 relative;

    &.on {
        --color: #ff5800;
        text-decoration: 1px underline var(--color);
        text-underline-offset: 16px;
        font-weight: 500;

        &::after {
            content: '';
            border: 6px solid transparent;
            border-bottom-color: var(--color);
            position: absolute;
            bottom: -8px;
            left: 50%;
            translate: -50%;
        }
    }
}
</style>
