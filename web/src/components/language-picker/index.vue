<script setup lang="ts">
import { locale, useLocale } from '@/locales'
import Locales from '@/locales/Locales'
import { type CascaderOption } from 'vant';

const { localeName } = useLocale()
const show = ref(false)

</script>

<template>
    <button v-bind="$attrs" @click="show = true">
        <slot :localeName="localeName">{{ localeName }}</slot>
    </button>
    <van-popup v-model:show="show" round position="bottom">
        <van-cascader v-model="locale" :field-names="{ text: 'localeName', value: 'code', children: 'children' }"
            title="请选择语言" :options="Locales.supported" @close="show = false" active-color="#ff5800"
            @finish="show = false" class="radio-selector">

        </van-cascader>

    </van-popup>
</template>

<style lang="scss">
.radio-selector .van-tabs__wrap {
    display: none;
}
</style>
