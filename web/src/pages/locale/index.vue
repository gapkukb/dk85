<script setup lang="ts">
import { useAsyncVisible } from '@/composables/useAsyncVisible'
import { useLocale } from '@/locales'
import { Locale } from 'vant'

const show = useAsyncVisible()
const { locale, supported, setLocale } = useLocale()

const actions = supported.map((item) => ({
    code: item.code,
    name: item.localeName,
    color: locale.value === item.code ? '#ff5800' : undefined,
}))

function onselect(item: (typeof actions)[number]) {
    setLocale(item.code)
}
</script>

<template>
    <van-action-sheet
        v-model:show="show"
        :actions="actions"
        :cancel-text="Locale.messages().cancel"
        close-on-click-action
        @select="onselect"
    />
</template>

<style lang="scss" scoped></style>
