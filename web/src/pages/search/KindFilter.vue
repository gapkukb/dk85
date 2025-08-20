<script setup lang="ts">
import type mock from './mock.json'

const model = defineModel<string>()
const props = defineProps<{ kinds: { name: string, value: string }[] }>()
</script>

<template>
    <div class="flex fixed left-0 right-0 px-24 pt-24 z-10 top-92 bg-#edf1f5"
        style="box-shadow: inset 0 -1px 0 0 #ddd">
        <button v-for="kind in kinds" :key="kind.name" class="px-24 fs-24 h-48 rd-t-4"
            :class="{ 'bg-primary c-white font-bold font-mono': model === kind.value }"
            @click="model = kind.value">
            {{ kind.name }}
        </button>
    </div>
</template>

<style lang="scss"></style>
