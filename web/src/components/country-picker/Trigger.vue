<script setup lang="ts">
defineProps<{ changeable?: boolean }>()
const Picker = defineAsyncComponent(() => import('./Picker.vue'))
const showPicker = ref(false)
</script>

<template>
    <button
        type="button"
        class="country-picker-trigger"
        @click="showPicker = changeable ?? false"
    >
        <slot></slot>
        <span>+95</span>
        <van-icon
            v-if="changeable"
            name="arrow-down"
            size="12"
        />
    </button>
    <Picker v-if="showPicker" />
</template>

<style lang="scss" scoped></style>
