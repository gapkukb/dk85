<script setup lang="ts">
import type { FieldRule } from 'vant'
const value = defineModel<string>({ required: true })

const length = 4
const regexp = new RegExp(`^\\w{${length}}$`)
const rules: FieldRule[] = [
    {
        pattern: regexp,
        message: t('form.error.code'),
    },
]
const src = ref()
function change() {
    src.value = `https://picsum.photos/id/${Math.round(Math.random() * 100)}/80/32`
}
change()

defineExpose({
    change
})
</script>

<template>
    <van-field v-model="value" name="graphic" class="van-field-solid" autocomplete="off" autocorrect="off"
        :border="false" :placeholder="$t('form.placeholder.code')" maxlength="4" :rules="rules">
        <template #left-icon>
            <van-icon class-prefix="iconfont" name="tuxingma1" class="opacity-50 text-19" />
        </template>
        <template #extra>
            <img :src="src" class="w-100 h-full absolute inset-0 left-auto rd-e-full" @click="change" />
        </template>
    </van-field>
</template>

<style lang="scss" scoped></style>
