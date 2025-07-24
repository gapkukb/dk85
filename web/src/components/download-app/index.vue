<script setup lang="ts">
import { rpx } from '@/utils/rpx';


</script>

<template>
    <van-floating-bubble teleport="#app" axis="y" :gap="{ x: 0, y: rpx(200) }"
        style="border-radius: 4px;background: #ddd;width: fit-content;height: fit-content;padding: 4px 6px;z-index: 1;"><img
            src="@/assets/images/app-download.gif" class="w-24 block"></van-floating-bubble>
</template>

<style lang="scss" scoped></style>