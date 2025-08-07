<script setup lang="ts">
import callCenter from './call-center';
const emit = defineEmits(['called'])
defineProps<{ iconClass?: any }>()

</script>

<template>
    <button type="button" class="inline-flex items-center gap-4 lh-[1] text-40" @click="callCenter">
        <slot></slot>
        <slot name="icon"><i class="iconfont iconfont-kefu"></i></slot>
    </button>
</template>
