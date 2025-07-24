<script setup lang="ts">
import { REGEXP_KM_NUMBER } from '@/constants/regexp'
import type { FieldRule } from 'vant'
import { useI18n } from 'vue-i18n'

const value = defineModel<string>()
const rules: FieldRule[] = [
    {
        pattern: REGEXP_KM_NUMBER,
        message: t('form.error.phone'),
    },
]
</script>

<template>
    <van-field
        v-model.trim="value"
        type="tel"
        class="van-field-solid van-field-phone"
        :border="false"
        maxlength="10"
        :placeholder="$t('form.placeholder.phone')"
        :rules="rules"
    >
        <template #left-icon>
            <CountryPicker>
                <van-icon
                    class-prefix="iconfont"
                    name="shouji"
                    class="c-#111 text-20"
                />
            </CountryPicker>
        </template>
    </van-field>
</template>

<style lang="scss">

</style>
