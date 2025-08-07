<script setup lang="ts">
import { locale, useLocale } from '@/locales'
import Locales from '@/locales/Locales'
import { useToggle } from '@vueuse/core'

const { localeName } = useLocale()
const [display, show] = useToggle(false)
</script>

<template>
    <slot
        :display="display"
        :localeName="localeName"
        :show="show"
        @click="show"
    >
        <button
            v-bind="$attrs"
            @click="() => show()"
        >
            <slot
                name="child"
                :localeName="localeName"
            >
                {{ localeName }}
            </slot>
        </button>
    </slot>
    <van-popup
        destroy-on-close
        v-model:show="display"
        round
        position="bottom"
        teleport="body"
    >
        <van-cascader
            v-model="locale"
            :field-names="{ text: 'localeName', value: 'code', children: 'children' }"
            title="请选择语言"
            :options="Locales.supported"
            @close="display = false"
            active-color="#ff5800"
            @finish="display = false"
            class="selector"
        ></van-cascader>
    </van-popup>
</template>

<style lang="scss">
.radio-selector .van-tabs__wrap {
    display: none;
}
</style>
