<script setup lang="ts">
import { useAsyncVisible } from '@/composables/useAsyncVisible'
const visible = useAsyncVisible()

defineOptions({
    inheritAttrs: false
})
</script>

<template>
    <van-popup v-model:show="visible" close-icon="close" style="width: 100%;height: 100%;" :overlay="false" closeable
        close-on-popstate v-on="$attrs" v-bind="$attrs">
        <slot />
    </van-popup>
</template>

<style lang="scss" scoped></style>
