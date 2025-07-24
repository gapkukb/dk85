<script setup lang="ts">
import { REGEXP_EMAIL } from '@/constants/regexp'
import type { FieldRule } from 'vant'

const value = defineModel<string>()
const rules: FieldRule[] = [
    {
        pattern: REGEXP_EMAIL,
        message: t('form.error.email'),
    },
]
</script>

<template>
    <van-field
        v-model.trim="value"
        type="email"
        autocomplete="off"
        autocorrect="off"
        class="van-field-solid van-field-email"
        :border="false"
        maxlength="30"
        :placeholder="$t('form.placeholder.email')"
        :rules="rules"
    >
        <template #left-icon>
            <van-icon
                name="envelop-o"
                class="opacity-50"
            />
        </template>
    </van-field>
</template>

<style lang="scss">
.van-field-email {
    // .van-field__error-message {
    //     left: -24px;
    // }
}
</style>
