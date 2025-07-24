<script setup lang="ts">
import useBalance from '@/composables/useBalance'
import { formatter } from '@/utils/number'

const { balance, loading, refresh } = useBalance()

defineSlots<{
    default(props: { balance: number; loading: boolean }): any
    button(props: { balance: number; loading: boolean }): any
    icon(props: { balance: number; loading: boolean }): any
}>()

defineProps<{ balanceClass?: any; buttonClass?: string; iconClass?: string }>()
</script>

<template>
    <div class="inline-flex items-center gap-[0.2em]">
        <slot
            :balance="balance"
            :loading="loading"
        >
            <h6 :class="balanceClass">{{ formatter.commatize(balance, 2) }}</h6>
        </slot>
        <slot
            name="button"
            :balance="balance"
            :loading="loading"
        >
            <button
                class="lh-1"
                :class="[buttonClass, { spin: loading }]"
                @click="refresh"
            >
                <slot
                    name="icon"
                    :balance="balance"
                    :loading="loading"
                >
                    <i-eva:refresh-outline
                        :class="[iconClass, { spin: loading }]"
                        @click="refresh"
                    />
                </slot>
            </button>
        </slot>
    </div>
</template>

<style lang="scss" scoped></style>
