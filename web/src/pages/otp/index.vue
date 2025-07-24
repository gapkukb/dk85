<script setup lang="ts">
import { queryOtp } from '@/api'
import { ref, useTemplateRef, type PropType } from 'vue'
const props = defineProps({
    length: {
        type: Number as PropType<number>,
        default: 6,
    },
})
const time = ref(60 * 1000)
const sentable = ref(false)
const show = ref(false)
const value = ref('')
const cursorIndex = ref<number>(0)
const field = useTemplateRef<HTMLInputElement>('field')
function move(index: number) {
    const input: HTMLInputElement = field.value!.querySelector('input')!
    input.setSelectionRange(index + 1, index + 1)
}

function selectionchange(e: Event) {
    cursorIndex.value = ((e.target as HTMLInputElement).selectionStart || 1) - 1
}

async function next() {
    await queryOtp()
    show.value = false
}

function resend() {
    sentable.value = false
}
</script>

<template>
    <van-popup
        v-model:show="show"
        destroy-on-close
        position="right"
        class="size-full flex"
        close-icon="close"
        closeable
    >
        <div class="m-auto w-full grid px-12">
            <h2>验证码已发送至</h2>
            <p>+639054160106</p>
            <div class="h-48"></div>
            <label ref="field">
                <van-field
                    v-model="value"
                    class="fixed size-0! p-0!"
                    hidden
                    maxlength="6"
                    type="digit"
                    autocomplete="off"
                    autofocus
                    @selectionchange="selectionchange"
                />
                <div
                    class="flex justify-between px-24 h-40"
                    :key="value"
                >
                    <span
                        v-for="(n, i) in 6"
                        :key="value[i]"
                        class="opt-key"
                        :class="{ 'opt-key-active': i === cursorIndex }"
                        @click="move(i)"
                    >
                        {{ value[i] }}
                    </span>
                </div>
            </label>
            <div class="h-48"></div>

            <van-button
                @click="next"
                color="#ff5800"
                block
                :disabled="value.length < length"
            >
                下一步
            </van-button>

            <button
                class="ml-auto w-72 rd-4 mt-24 bg-blue text-white h-24 text-12 disabled:bg-#ccc"
                :disabled="!sentable"
                @click="resend"
            >
                <span v-if="sentable">Resend</span>
                <van-count-down
                    v-else
                    :time="time"
                    format="sss"
                    @finish="sentable = true"
                    style="color: inherit"
                />
            </button>
            <button
                class="ml-auto mt-24 text-12 text-blue"
                disabled
            >
                Has Trouble?
            </button>
        </div>
    </van-popup>
</template>

<style lang="scss">
.opt-key {
    @apply aspect-ratio-square text-center border border-solid border-red rd-4 font-semibold;
    line-height: 40px;

    &-active::after {
        content: '|';
        display: inline-block;
        line-height: 1;
        width: 0;
        animation: cursor-blinks 1.3s infinite steps(1, start);
    }
}
@keyframes cursor-blinks {
    0%,
    100% {
        opacity: 1;
    }
    50% {
        opacity: 0;
    }
}
</style>
