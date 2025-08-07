<script setup lang="ts">
import Locales from '@/locales/Locales'

const value = defineModel<string>()
defineProps<{ changeable?: boolean }>()

const showPicker = ref(false)
</script>

<template>
    <button
        type="button"
        class="country-picker-trigger"
        @click="showPicker = changeable ?? false"
    >
        <slot></slot>
        <span class="fs-24">{{ value }}</span>
        <van-icon
            v-if="changeable"
            name="arrow-down"
            size="12"
        />
    </button>
    <van-popup
        destroy-on-close
        v-model:show="showPicker"
        round
        position="bottom"
        teleport="body"
    >
        <van-cascader
            v-model="value"
            :field-names="{ text: 'areaCode', value: 'areaCode' }"
            title="请选择国家"
            :options="Locales.supported"
            @close="showPicker = false"
            active-color="#ff5800"
            @finish="showPicker = false"
            class="selector"
        ></van-cascader>
    </van-popup>
</template>

<style lang="scss"></style>
