<script setup lang="ts">
import { useAsyncVisible } from '@/composables/useAsyncVisible'

const show = useAsyncVisible()
const announcements = ref(Array.from<string>({ length: 6 }).fill('🎁လော့အင်အတွက်ဆုကြီးရယူပါ🎁🎁လော့အင်အတွက်ဆုကြီးရယူပါ🎁'))
</script>

<template>
    <van-popup
        v-model:show="show"
        style="background: none"
        teleport="#app"
    >
        <div class="promo-modal">
            <h1 class="lh-60 text-22 text-center text-white font-semibold">{{ $t('page.announcement') }}</h1>
            <van-cell-group
                inset
                class="min-h-264"
            >
                <van-cell
                    v-for="announcement in announcements"
                    :key="announcement"
                    :title="announcement"
                    title-class="truncate"
                    is-link
                ></van-cell>
            </van-cell-group>
        </div>
        <div class="h-32"></div>
        <button
            class="bg-white bg-op-40 lh-1 block mx-auto rd-full text-18 p-6 text-white"
            @click="show = false"
        >
            <van-icon name="cross" />
        </button>
    </van-popup>
</template>

<style lang="scss">
.promo-modal {
    width: 310px;
    padding-bottom: 12px;
    border-radius: 16px;
    background: #f8d0c7 url('@/assets/images/promo-modal-bg.png') no-repeat 0 0 / cover;
}
</style>
