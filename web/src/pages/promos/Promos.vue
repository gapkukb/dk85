<script setup lang="ts">
import { useAdversite } from '@/composables/useAdversite';

const { navigate, result: events } = useAdversite(3, 5)


</script>

<template>
    <div class="grid gap-16">
        <button v-for="(item, index) in events" class="block w-full h-280" @click="navigate(item.url)">
            <img v-lazy="item.image" class="size-full rd-8 object-cover">
        </button>
    </div>
</template>

<style lang="scss" scoped></style>