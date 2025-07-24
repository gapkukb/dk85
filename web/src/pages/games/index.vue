<script setup lang="ts">
const fill = '#d5d5d5'
</script>

<template>
    <Skeleton repeatable fixed item-height="136" item-width="127">
        <rect width="123" height="132" />
        <rect width="123" height="78" :fill="fill" />
        <rect x="4" y="86" width="80" height="14" :fill="fill" />
        <circle cx="110" cy="92" r="8" :fill="fill" />
        <rect x="4" y="110" width="114" height="14" :fill="fill" />
    </Skeleton>
</template>

<style lang="scss" scoped></style>
