<script setup lang="ts">
import { popupProps } from 'vant'
import type { PropType } from 'vue'

const props = defineProps({
    ...popupProps,
    title: { type: String as PropType<string> },
})
</script>

<template>
    <van-popup
        v-bind="{ ...props, ...$attrs }"
        style="background: none"
        teleport="body"
        destroy-on-close
        :close-on-click-overlay="false"
        close-icon="close"
        closeable
        class="pop-page"
    >
        <h1 class="lh-100 text-36 rd-t-24 mx-24 text-center text-white font-semibold bg-primary">{{ title }}</h1>
        <slot />
    </van-popup>
</template>

<style lang="scss">
.pop-page {
    padding-top: 112px;
    .van-popup__close-icon {
        font-size: 72px;
        top: 0;
        color: white;
    }
}
</style>
