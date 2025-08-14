<script setup lang="ts">
import { useBack } from '@/composables/useBack'

const props = defineProps<{ title?: string; backPath?: string }>()
const back = useBack({ web: props.backPath })
defineSlots<{ actions: void; left: void; default: void }>()
</script>

<template>
    <div class="h-116 relative z-10">
        <div class="navbar">
            <button
                class="size-64 rd-full bg-white fs-32"
                @click="back"
            >
                <i class="iconfont iconfont-to-left"></i>
            </button>
            <slot>
                <h1 class="fs-36 font-600 flex-1">
                    {{ title }}
                </h1>
            </slot>
            <slot name="actions"></slot>
        </div>
    </div>
</template>

<style lang="scss">
.navbar{
    @apply h-116 bg-#eef2f5 flex items-center gap-32 fixed left-0 right-0 top-0 px-24 z-10;
}
</style>