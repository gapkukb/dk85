<script setup lang="ts">
const props = defineProps<{ text?: string, iconClass?: any }>()
</script>

<template>
    <button v-clipboard="text" class="inline-flex justify-center items-center">
        <slot></slot>
        <i-material-symbols-light:content-copy-outline class="flex-shrink-0" :class="iconClass" />
    </button>
</template>

<style lang="scss" scoped></style>