<script setup lang="ts">
import { useAsyncVisible } from '@/composables/useAsyncVisible'

const show = useAsyncVisible()
</script>

<template>
    <van-popup
        v-model:show="show"
        position="right"
        class="size-full"
    >
        Piceker
    </van-popup>
</template>

<style lang="scss" scoped></style>
