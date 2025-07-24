<script setup lang="ts">
import { REGEXP_PASSWORD } from '@/constants/regexp'
import type { FieldRule } from 'vant'


const value = defineModel<string>({ required: true })
const props = defineProps<{ isRepeat?: boolean; password?: string }>()
const rule: FieldRule = {
    pattern: REGEXP_PASSWORD,
    message: t('form.error.password'),
}
const visible = ref(false)
const placeholder = computed(() => {
    return props.isRepeat ? t('form.placeholder.repassword') : t('form.placeholder.password')
})
const rules = computed<FieldRule[]>(() => {
    if (!props.isRepeat) return [rule]
    return [
        rule,
        {
            placeholder: t('form.placeholder.repassword'),
            validator(value) {
                if (!value || value !== props.password) {
                    return t('form.error.repassword')
                }
            },
        } as FieldRule
    ]
})
</script>

<template>
    <van-field v-model="value" name="password" class="van-field-solid" autocomplete="off" autocorrect="off" clearable
        maxlength="16" :border="false" :type="visible ? 'text' : 'password'" :placeholder="placeholder" :rules="rules">
        <template #left-icon>
            <van-icon class-prefix="iconfont" name="tuxingma" class="opacity-50 text-20" />
        </template>

        <template #extra>
            <button class="m-auto lh-1 pl-6" @click="visible = !visible">
                <van-icon :name="visible ? 'eye-o' : 'closed-eye'" size="20" color="#999" />
            </button>
        </template>
    </van-field>
</template>

<style lang="scss" scoped></style>
