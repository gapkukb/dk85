<script setup lang="ts">

defineProps<{ channel: model.funds.Channel }>()
defineEmits<{ click: void }>()
</script>

<template>
    <van-cell :title="channel.name" is-link center title-class="pl-24 font-semibold" @click="$emit('click')">
        <template #icon>
            <img :src="channel.logo" class="size-48 scale-120 object-cover rd-full">
        </template>

    </van-cell>
</template>

<style lang="scss" scoped></style>