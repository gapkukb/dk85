<script setup lang="ts">
import PuzzleSlider from './PuzzleSlider.vue'

const value = ref(0)
const show = ref(false)
nextTick(() => {
    show.value = true
})
</script>

<template>
    <van-popup v-model:show="show" position="bottom" class="p-12" round closeable>
        <h1 class="text-18 text-center block">Please verify</h1>
        <p class="text-14 py-8 text-center block">Drag the slider to fit the puzzle</p>
        <div class="relative">
            <button class="absolute right-10 top-10 z-1 bg-white rd-full p-4">
                <i-simple-line-icons:refresh />
            </button>
            <img src="https://c66hk.s3.ap-east-1.amazonaws.com/682f2613-fb67-489f-815d-d928c63aeb65" class="w-full aspect-ratio-2" />
            <img src="https://c66hk.s3.ap-east-1.amazonaws.com/c538452b-e1c8-4490-8b98-8c45ad0b4e38" class="absolute top-0 h-full" :style="{ left: value + '%' }" />
        </div>
        <PuzzleSlider v-model="value" />
    </van-popup>
</template>

<style lang="scss"></style>
