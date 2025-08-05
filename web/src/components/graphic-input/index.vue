<script setup lang="ts">
import { queryCaptcha } from '@/api/app.api'
import { useQuery } from '@tanstack/vue-query'
import type { FieldRule } from 'vant'

const value = defineModel<string>('value')
const timer = defineModel<string>('timestamp')
const props = withDefaults(defineProps<{ name?: string }>(), { name: "code" })

const length = 4
const regexp = new RegExp(`^\\w{${length}}$`)
const rules: FieldRule[] = [
    {
        pattern: regexp,
        message: t('form.error.code'),
    },
]

const { data, refetch } = useQuery({
    queryKey: ['queryCaptcha'],
    queryFn: async () => {
        timer.value = Date.now().toString()
        await Promise.resolve()
        return queryCaptcha({ time: timer.value })
    },
    staleTime: 0,
    gcTime: 0,
    retry: 0,
    select(data) {
        revoke()
        const url = window.URL.createObjectURL((data.data as Blob))
        return url;
    },
})

function revoke() {
    window.URL.revokeObjectURL(data.value as string);
}

onBeforeUnmount(revoke)


</script>

<template>

    <van-field v-model="value" :name="name" class="van-field-solid" autocomplete="off" autocorrect="off" :border="false"
        :placeholder="$t('form.placeholder.code')" maxlength="4" :rules="rules">
        <template #left-icon>
            <van-icon class-prefix="iconfont" name="tuxingma1" class="opacity-50 fs-32" />
        </template>
        <template #extra>
            <!-- @vue-ignore -->
            <img :src="data" class="w-200 h-full absolute inset-0 left-auto rd-e-full" @click="refetch" />
        </template>
    </van-field>
</template>

<style lang="scss" scoped></style>
