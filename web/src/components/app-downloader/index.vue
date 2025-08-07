<script setup lang="ts">
import { rpx } from '@/utils/rpx'
</script>

<template>
    <van-floating-bubble
        teleport="#app"
        axis="y"
        :gap="{ x: 0, y: rpx(200) }"
        class="!rd-8 !bg-#ddd !size-fit !px-8 !py-6 !z-1"
    >
        <a
            href="https://dl.lskhbgod.com/3007_DK85_v1006_03041421_release.apk"
            download="dk85"
        >
            <img
                src="@/assets/images/app-download.gif"
                class="w-48 block"
            />
        </a>
    </van-floating-bubble>
</template>

<style lang="scss" scoped></style>
