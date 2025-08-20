<script setup lang="ts">

defineEmits<{
    click: void
}>()

</script>

<template>
    <button class="size-64 rd-full bg-white fs-32" @click="$emit('click')">
        <i class="iconfont iconfont-to-left"></i>
    </button>
</template>

<style lang="scss" scoped></style>