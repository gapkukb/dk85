<script lang="ts">
const wh = window.innerHeight
</script>
<script setup lang="ts">
defineProps<{
    description?: string
    buttonText?: string
    to?: string
    replace?: boolean
}>()

defineEmits<{
    click: []
}>()
</script>

<template>
    <van-empty :style="{ height: `${wh}px` }" class="exception" :description="description || '这里什么也没有'">
        <template #image>
            <i class="iconfont iconfont-nothing !fs-250 c-primary"></i>
        </template>

        <van-button v-if="buttonText" :to="to" :replace="replace" type="danger" size="normal">
            {{ buttonText }}
        </van-button>
    </van-empty>
</template>

<style lang="scss">
.exception {
    @apply lh-none fixed inset-0 z--1 whitespace-nowrap;
}
</style>
