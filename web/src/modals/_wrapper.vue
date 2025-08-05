<script setup lang="ts">
import { popupProps, type PopupProps } from 'vant'
const show = defineModel({ default: false })
const current = defineProps(popupProps)
const attr = useAttrs()

const all = computed<PopupProps>(() => ({ ...{ destroyOnClose: true }, ...attr, ...current }))
</script>

<template>
    <van-popup
        v-bind="all"
        v-model:show="show"
    >
        <slot></slot>
    </van-popup>
</template>

<style lang="scss" scoped></style>
