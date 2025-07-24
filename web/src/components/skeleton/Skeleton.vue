<script setup lang="ts">
import { useResizeObserver } from '@vueuse/core'
import { onMounted, ref, useTemplateRef, type PropType } from 'vue'
import Defs from './Defs.vue'
type NumberLike = Required<number | `${number}`>
type Numberish = number | string

const patternId = (Math.random() * Math.random()).toString(32).substring(2)
const wh = window.innerHeight * 2

const props = defineProps({
    itemWidth: {
        type: [Number, String] as PropType<NumberLike>,
        default: '100%',
    },
    itemHeight: {
        type: [Number, String] as PropType<NumberLike>,
        default: '100%',
    },
    width: {
        type: [Number, String] as PropType<Numberish>,
        default: '100%',
    },
    height: {
        type: [Number, String] as PropType<Numberish>,
    },
    fill: {
        type: String as PropType<string>,
        default: '#eee',
    },
    bgcolor: {
        type: String as PropType<string>,
        default: '#fff',
    },
    repeatable: {
        type: Boolean as PropType<boolean>,
        default: false,
    },
    fixed: {
        type: Boolean as PropType<boolean>,
        default: false,
    },
})
</script>

<template>
    <svg xmlns="http://www.w3.org/2000/svg" :viewBox="`0 0 750 ${wh}`" :width="width" :height="height || wh"
        preserveAspectRatio="xMinYMin meet" class="block flex-basis-auto" role="alert" aria-busy="true"
        aria-label="Loading..." aria-live="polite" :fill="fill" style="z-index: 0"
        :style="{ position: fixed ? 'fixed' : undefined }">
        <title>Loading...</title>
        <template v-if="repeatable">
            <defs>
                <pattern :id="patternId" :width="itemWidth" :height="itemHeight" patternUnits="userSpaceOnUse">
                    <slot>
                        <rect width="100%" height="100%" />
                    </slot>
                </pattern>
            </defs>
            <Defs :fill="`url(#${patternId})`" />
        </template>
        <slot v-else>
            <Defs />
        </slot>
    </svg>
</template>
