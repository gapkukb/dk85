<script setup lang="ts">
import { REGEXP_EMAIL, REGEXP_KM_NUMBER } from '@/constants/regexp'
import { type FieldRule } from 'vant'
import { useCountdown } from '@vueuse/core'
import useAsyncFunction from '@/composables/useAsyncFunction'
import { ModalGraphicInput } from '../graphic-input'
import { CallCenter2 } from '../call-center'

const value = defineModel<string>({ required: true })
const props = withDefaults(defineProps<{ target?: string; disabled?: boolean; type: 'phone' | 'email'; autoSendOnMount?: boolean; graphicRequired?: boolean, cs?: boolean }>(), { cs: true })
const length = 6
const regexp = new RegExp(`^\\d{${length}}$`)
const rules: FieldRule[] = [
    {
        pattern: regexp,
        message: t('form.error.otp'),
    },
]
const isDirty = ref(false)
const showGraphic = ref(false)
const graphicValue = ref('')

const enable = computed(() => {
    if (props.target === void 0) return true
    if (props.type === 'phone') return REGEXP_KM_NUMBER.test(props.target)
    if (props.type === 'email') return REGEXP_EMAIL.test(props.target)
    return false
})

const { remaining, isActive, start } = useCountdown(3)

const { doing, todo } = useAsyncFunction(() => {
    return Promise.delay(1000)
})

function send() {
    todo()
        .then(start)
        .then(() => {
            isDirty.value = true
        })
}

function onSend() {
    if (props.graphicRequired) {
        showGraphic.value = true
    } else {
        send()
    }
}

function onGraphicSuccess() {
    showGraphic.value = false
    send()
}

props.autoSendOnMount && enable.value && send()
</script>

<template>
    <div class="inline-grid w-full">
        <van-field v-model="value" type="digit" class="van-field-solid" autocomplete="off" autocorrect="off"
            :border="false" :placeholder="$t('form.placeholder.otp')" :maxlength="length" :rules="rules">
            <template #left-icon>
                <van-icon class-prefix="iconfont" name="duanxinyanzhengma" class="opacity-50 text-20" />
            </template>
            <template #extra>
                <van-button :disabled="!enable || isActive || doing" type="primary" size="mini" round class="min-w-60"
                    @click="onSend">
                    <span v-if="isActive" class="px-12">
                        {{ remaining }}S
                    </span>
                    <span v-else class="px-12 uppercase">
                        {{ isDirty ? $t('form.resend') : $t('form.send') }}
                    </span>
                </van-button>
            </template>
        </van-field>


        <CallCenter2 v-if="cs" />
    </div>

    <ModalGraphicInput v-model:show="showGraphic" v-model="graphicValue" @success="onGraphicSuccess" />
</template>

<style lang="scss"></style>
