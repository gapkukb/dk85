<script setup lang="ts">
import useAsyncFunction from '@/composables/useAsyncFunction'
import type graphicInput from '.'

const show = defineModel<boolean>('show')
const value = defineModel<string>({ default: '' })
const comp = ref<InstanceType<typeof graphicInput>>()
const emit = defineEmits(['success'])

const { doing, todo } = useAsyncFunction(function () {
    return Promise.delay(3000).then(() => {
        emit('success', value.value)
    })
})
</script>

<template>
    <van-popup v-model:show="show" teleport="body" position="bottom" :closeable="!doing" class="px-16 pt-48 pb-32"
        :close-on-click-overlay="false" destroy-on-close @vue:unmounted="value = ''">
        <van-form @submit="todo">
            <GraphicInput v-model="value" ref="comp" />
            <div class="text-right text-12 c-#ff5800">
                <button type="button" class=" p-8" @click="comp!.change">
                    {{ $t("form.changeGraphic") }}
                </button>
            </div>
            <div class="h-16"></div>
            <van-button :disabled="doing" type="primary" native-type="submit" block>
                {{ $t('app.done') }}
            </van-button>
        </van-form>
    </van-popup>
</template>
