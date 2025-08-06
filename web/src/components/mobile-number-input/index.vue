<script setup lang="ts">
import { REGEXP_KM_NUMBER } from '@/constants/regexp'
import type { FieldRule } from 'vant'

const value = defineModel<string>({ default: '' })
const props = withDefaults(defineProps<{ name?: string }>(), { name: "mobile" })
const rules: FieldRule[] = [
    {
        pattern: REGEXP_KM_NUMBER,
        message: t('form.error.phone'),
    },
]
</script>

<template>
    <van-field v-model.trim="value" :name="name" type="tel" class="van-field-solid van-field-phone" :border="false"
        maxlength="9" :placeholder="$t('form.placeholder.phone')" :rules="rules">
        <template #left-icon>
            <CountryPicker>
                <van-icon class-prefix="iconfont" name="mobile" class="c-#111 !text-40" />
            </CountryPicker>
        </template>
    </van-field>
</template>

<style lang="scss"></style>
