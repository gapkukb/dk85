<script setup lang="ts">
import { useApp } from '@/stores/app.store'

const app = useApp()
</script>

<template>
    <router-view v-slot="{ Component }">
        <keep-alive :include="app.cachedViews">
            <component :is="Component" />
        </keep-alive>
    </router-view>
</template>
