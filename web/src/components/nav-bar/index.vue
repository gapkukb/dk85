<script setup lang="ts">
import { useBack } from '@/composables/useBack';

const props = defineProps<{ title?: string }>()
const back = useBack()
defineSlots<{ right: void, left: void; title: void }>()
</script>

<template>
    <div>
        <van-nav-bar :title="title || $route.meta.title" left-arrow @click-left="back"></van-nav-bar>
    </div>
</template>
