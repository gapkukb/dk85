<script setup lang="ts">
import Locales from '@/locales/Locales'

const show = ref(true)
const areaCode = ref('')
</script>

<template>
    <van-popup
        destroy-on-close
        v-model:show="show"
        round
        position="bottom"
        teleport="body"
    >
        <van-cascader
            v-model="areaCode"
            :field-names="{ text: 'localeName', value: 'areaCode' }"
            title="请选择语言"
            :options="Locales.supported"
            @close="show = false"
            active-color="#ff5800"
            @finish="show = false"
            class="selector"
        ></van-cascader>
    </van-popup>
</template>

<style lang="scss">

</style>
