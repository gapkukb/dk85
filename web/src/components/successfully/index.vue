<script setup lang="ts">
import Icon from './icon.svg?component'
import { useCountdown } from '@vueuse/core'
import { I18nT } from 'vue-i18n'
const show = defineModel<boolean>()
const props = defineProps<{ type: 'created' | 'deleted' | 'updated' }>()
const title = computed(() => {
    if (props.type === 'created') return t('app.ok_created')
    if (props.type === 'deleted') return t('app.ok_deleted')
    if (props.type === 'updated') return t('app.ok_updated')
    return ''
})
const { remaining, reset, start } = useCountdown(5, {
    immediate: true,
    onComplete: close,
})

function close() {
    show.value = false
}
</script>

<template>
    <van-popup
        v-model:show="show"
        teleport="body"
        class="!size-full !m-0"
        position="bottom"
        destroy-on-close
        @open="start"
        @closed="reset"
    >
        <div class="grid p-16 pt-48 place-items-center">
            <Icon class="block size-100 text-#1989fa" />
            <h1 class="mt-16 font-semibold">{{ title }}</h1>
            <div class="h-32"></div>
            <van-button
                type="primary"
                block
                @click="close"
            >
                {{ $t('app.close') }}
            </van-button>
            <i18n-t
                keypath="app.ok_autoclose"
                tag="p"
                class="text-12 text-#999 mt-32"
            >
                <span class="text-primary min-w-1em inline-block text-center">{{ remaining }}</span>
            </i18n-t>
        </div>
    </van-popup>
</template>

<style lang="scss"></style>
