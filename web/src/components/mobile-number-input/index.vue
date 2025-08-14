<script setup lang="ts">
import { REGEXP_KM_NUMBER } from '@/constants/regexp'
import { i18n } from '@/locales'
import Locales from '@/locales/Locales'
import type { FieldRule } from 'vant'

const value = defineModel<string>()
const props = withDefaults(defineProps<{ name?: string }>(), { name: 'mobile' })
const number = ref('')
const areaCode = ref(Locales.getLocale(i18n.global.locale)?.areaCode)

const rules: FieldRule[] = [
    {
        pattern: REGEXP_KM_NUMBER,
        message: t('form.error.phone'),
    },
]

watchEffect(() => {
    value.value = (areaCode.value + number.value).substring(1)
})
</script>

<template>
    <van-field
        v-model.trim="number"
        :name="name"
        type="tel"
        class="van-field-solid van-field-phone"
        :border="false"
        maxlength="9"
        :placeholder="$t('form.placeholder.phone')"
        :rules="rules"
        size="large"
    >
        <template #left-icon>
            <CountryPicker
                v-model="areaCode"
                changeable
            >
                <van-icon
                    class-prefix="iconfont"
                    name="mobile"
                    class="c-#999 !text-36"
                />
            </CountryPicker>
        </template>
    </van-field>
</template>

<style lang="scss"></style>
