<script setup lang="ts">
import { REGEXP_ACCOUNT } from '@/constants/regexp'
import type { FieldRule } from 'vant'
import { useI18n } from 'vue-i18n'

const value = defineModel<string>({ required: true })
const rules: FieldRule[] = [
    {
        pattern: REGEXP_ACCOUNT,
        message: useI18n().t('form.error.account'),
    },
]
</script>

<template>
    <van-field
        v-model.trim="value"
        name="username"
        class="van-field-solid"
        :border="false"
        :placeholder="$t('form.placeholder.account')"
        :rules="rules"
    >
        <template #left-icon>
            <van-icon
                name="contact-o"
                class="opacity-50"
            />
        </template>
    </van-field>
</template>

<style lang="scss" scoped></style>
