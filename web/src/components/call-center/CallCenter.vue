<script setup lang="ts">
import { Modals, ModalsName } from '@/modals'
const emit = defineEmits(['called'])
defineProps<{ iconClass?: any }>()

function call() {
    // Modals.open(ModalsName.cs), emit('called')

    alert("跳转客服 ")
}
</script>

<template>
    <button type="button" class="inline-flex items-center gap-4 lh-[1] text-20" @click="call">
        <slot></slot>
        <slot name="icon"><i-mdi:customer-service :class="iconClass"/></slot>
    </button>
</template>
