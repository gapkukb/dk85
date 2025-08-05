<script setup lang="ts">
import { useTimeoutFn } from '@vueuse/core'
const show = ref(true)
useTimeoutFn(skip, 3000)
function skip() {
    show.value = false
}
</script>

<template>
    <div
        v-if="show"
        class="fixed bg-white inset-0 z-1000"
        style="background: url('/splash.webp') no-repeat 0 0/100%"
    >
        <button
            class="flex ml-auto c-white mt-8 mr-16 rd-full border-1 border-white border-solid px-8 fs-12"
            @click="skip"
        >
            跳过
        </button>
    </div>
</template>

<style lang="scss"></style>
