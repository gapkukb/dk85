<script setup lang="ts">
import { formatter } from '@/utils/number';
import { views } from './levels.config';

const props = defineProps<{
    amount: number, type: 'advance' | 'weekly' | 'monthly' | 'annual'
}>()
const view = views[props.type]
</script>

<template>
    <div class="h-180 bg-#f6f7f8 rd-4 grid place-items-center gap-8 px-8 py-16">
        <div class="lh-[1] text-primary op-70"><i class="iconfont text-32" :class="view.icon"></i></div>
        <h3>{{ view.title }}</h3>
        <h4><span class="font-medium fs-16">{{ formatter.commatize(amount) }}</span><span class="fs-12"> MMK</span></h4>
        <button disabled class="bg-primary block min-w-100 text-12 rd-full h-28 text-white disabled:op-50">
            {{ $t("app.claim") }}
        </button>
    </div>
</template>

<style lang="scss" scoped></style>