<script setup lang="ts">
import Icon from './icon.svg?component'
import { useCountdown } from '@vueuse/core'
import { useBack } from '@/composables/useBack';
import { SUCCESS_TYPE } from '@/utils/success';

const props = defineProps<{ type: SUCCESS_TYPE }>()
const titles: Record<SUCCESS_TYPE, any> = {
    [SUCCESS_TYPE.SETTLE]: t('app.ok_settled'),
    [SUCCESS_TYPE.CREATED]: t('app.ok_created'),
    [SUCCESS_TYPE.BOUND]: t('app.ok_bound'),
    [SUCCESS_TYPE.DELETED]: t('app.ok_deleted'),
    [SUCCESS_TYPE.UPDATED]: t('app.ok_updated'),
}

const title = titles[props.type] || titles.created;
const back = useBack(undefined, true)
const { remaining } = useCountdown(5, {
    immediate: true,
    onComplete: back,
})


</script>

<template>
    <nav-bar fixed />
    <Icon class="block size-100 text-#1989fa" />
    <h1 class="mt-16 font-semibold c-#666">{{ title }}</h1>
    <van-button type="primary" block @click="back">
        {{ $t('app.close') }}
    </van-button>
    <i18n-t keypath="app.ok_autoclose" tag="p" class="text-12 text-#999">
        <span class="text-primary min-w-1em inline-block text-center">{{ remaining }}</span>
    </i18n-t>
</template>

<style lang="scss">
.page-success {
    @apply bg-white grid p-16 pt-84 gap-16 place-items-center content-start;
}
</style>
