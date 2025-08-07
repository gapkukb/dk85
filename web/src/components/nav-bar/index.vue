<script setup lang="ts">
import { useBack } from '@/composables/useBack'

const props = defineProps<{ title?: string; backPath?: string }>()
const back = useBack({ web: props.backPath })
defineSlots<{ actions: void; left: void; default: void }>()
</script>

<template>
    <div class="h-116">
        <div class="h-92 bg-#eef2f5 flex items-center gap-32 fixed left-0 right-0 top-0 px-24 z-10">
            <button
                class="size-64 rd-full bg-white fs-32"
                @click="back"
            >
                <i class="iconfont iconfont-to-left"></i>
            </button>
            <h1 class="fs-36 font-600 flex-1">
                <slot>{{ title }}</slot>
            </h1>
            <slot name="actions"></slot>
        </div>
    </div>
</template>
