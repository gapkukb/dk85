<script setup lang="ts">
import { queryCaptcha } from '@/api/app.api'
import { useQuery } from '@tanstack/vue-query'
import type { FieldRule } from 'vant'
const value = defineModel<string>({ default: '' })
const props = withDefaults(defineProps<{ name?: string }>(), { name: "code" })

const length = 4
const regexp = new RegExp(`^\\w{${length}}$`)
const timestamp = ref('')
const rules: FieldRule[] = [
    {
        pattern: regexp,
        message: t('form.error.code'),
    },
]

const { data, refetch } = useQuery({
    queryKey: ['queryCaptcha'],
    queryFn: () => {
        timestamp.value = Date.now().toString()
        return queryCaptcha({ time: timestamp.value })
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
    <i id="timestamp" :data-timestamp="timestamp"></i>
    <van-field v-model="value" :name="name" class="van-field-solid" autocomplete="off" autocorrect="off" :border="false"
        :placeholder="$t('form.placeholder.code')" maxlength="4" :rules="rules">
        <template #left-icon>
            <van-icon class-prefix="iconfont" name="tuxingma1" class="opacity-50 text-19" />
        </template>
        <template #extra>
            <!-- @vue-ignore -->
            <img :src="data" class="w-100 h-full absolute inset-0 left-auto rd-e-full" @click="refetch" />
        </template>
    </van-field>
</template>

<style lang="scss" scoped></style>
