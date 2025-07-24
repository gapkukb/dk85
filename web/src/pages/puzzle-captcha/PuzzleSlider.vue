<script setup lang="ts">
const value = defineModel<number>({ required: true })
const min = 0
const max = 100
const width = computed(() => value.value / (max - min + 52))
</script>

<template>
    <div :style="{ '--width': width }" class="z-1 relative bg-red rd-full h-40">
        <div class="aaaaa"></div>
        <input type="range" v-model="value" id="" class="custom-range" :min="min" :max="max" step="0.01" />
    </div>
</template>

<style lang="scss">
.custom-range {
    -webkit-appearance: none;
    width: 100%;
    // height: 40px;
    // background: blue;
    outline: none;
}

/* Chrome, Safari, Edge */
.custom-range::-webkit-slider-thumb {
    -webkit-appearance: none;
    height: 52px;
    aspect-ratio: 1;
    border-radius: 50%;
    cursor: pointer;
    margin-top: -6px;
    transform: translate3d();
    background-color: #fff;
    background-repeat: no-repeat;
    background-size: 150%;
    background-position: center center;
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%231bab43' viewBox='0 0 50 50'%3E%3Cpath d='M25 42c-9.4 0-17-7.6-17-17S15.6 8 25 8s17 7.6 17 17s-7.6 17-17 17m0-32c-8.3 0-15 6.7-15 15s6.7 15 15 15s15-6.7 15-15s-6.7-15-15-15'/%3E%3Cpath d='m24.7 34.7l-1.4-1.4l8.3-8.3l-8.3-8.3l1.4-1.4l9.7 9.7z'/%3E%3Cpath d='M16 24h17v2H16z'/%3E%3C/svg%3E");
}

.custom-range::-webkit-slider-runnable-track {
    height: 40px;
    // background: red;
}
.aaaaa {
    @apply absolute left-0 top-0 bottom-0 bg-white pointer-events-none -z-1;
    width: calc(var(--width) * (100% - 52px) + 26px);
}
</style>
