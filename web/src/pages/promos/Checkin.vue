<script setup lang="ts">
import useDelegate from '@/composables/useDelegate'
import { useQuery } from '@tanstack/vue-query'
import dayjs from 'dayjs'
import img0 from './assets/coin-0.webp'
import img1 from './assets/coin-1.webp'
import img2 from './assets/coin-2.webp'
import useAsyncFunction from '@/composables/useAsyncFunction'
import { doDailyBouns, queryDailyBouns } from '@/api'
import { useUser } from '@/stores/user.store'
import mock from './mock'
import { modals } from '@/modals'
import useBalance from '@/composables/useBalance'

const today = dayjs().format('YYYY-MM-DD')
const icons: Record<number, string> = {
    0: img1,
    1: img1,
    2: img0,
    3: img2,
}
const user = useUser()
const { refresh } = useBalance()
const el = useTemplateRef<HTMLDivElement>('track')
const showRules = ref(false)

const { doing, todo } = useAsyncFunction(async function () {
    if (!user.authenticated) return modals.authentication.open()
    await doDailyBouns()
    refresh()
    return refetch()
})

const { data, refetch, isPlaceholderData } = useQuery({
    queryKey: ['checkin_list', user.authenticated],
    // queryFn: queryCheckin,
    queryFn: ({ queryKey: [_, flag] }) => flag ? queryDailyBouns() : mock(),
    placeholderData: [],
    select(data) {
        scrollIntoView()
        return data;
    },
})

//签到状态 - 0可签1已签2过期3不可签
const disabled = computed(() => {
    if (!data.value?.length) return true;
    if (user.authenticated) return !data.value.some(i => i.status === 0)
    return doing.value || isPlaceholderData.value
})

function scrollIntoView() {
    setTimeout(() => {
        const target = el.value?.querySelector('.checkin-state-0') || el.value?.querySelector('.today')
        target?.scrollIntoView({
            behavior: 'instant',
            inline: 'center',
        })
    })
}

onActivated(scrollIntoView)
</script>

<template>
    <div class="bg-white p-24 rd-16 bg-op-95">
        <h5 class="flex justify-between">
            <span class="font-semibold text-32">{{ $t('promos.name') }}</span>
            <button class="text-primary block expand-16" @click="showRules = true">
                <van-icon name="info-o" />
            </button>
        </h5>
        <div class="h-192 flex gap-8 overflow-scroll py-32 scroll-none" ref="track">
            <figure v-for="item in data" :key="item.date" class="checkin-item"
                :class="[`checkin-state-${item.status}`, { today: today === item.date }]">
                <img :src="icons[item.status]" class="size-64" />
                <figcaption class="checkin-item-text">{{ dayjs(item.date).format('DD MMM') }}</figcaption>
            </figure>
        </div>
        <van-button type="danger" block :disabled="disabled" @click="todo">
            {{ $t('promos.confirm') }}
        </van-button>
    </div>
    <van-popup teleport="body" v-model:show="showRules" closeable position="bottom" class="p-32">
        <h6 class="font-semibold text-32">{{ $t('promos.checkin.title') }}</h6>
        <div class="mt-32 h-60vh overflow-auto whitespace-pre-line">{{ $t('promos.checkin.rules') }}</div>
    </van-popup>
</template>

<style lang="scss">
.checkin-item {
    --color: rgba(255, 88, 0, var(--op, 0.1));

    @apply flex-shrink-0 w-86 h-128 rd-8 text-center py-12;
    background: linear-gradient(0deg, var(--color), var(--color)),
        radial-gradient(710.82% 50% at 13.62% 0%, rgba(255, 255, 255, 0.301) 0%, rgba(255, 230, 215, 0.0001) 100%);

    &-text {
        @apply text-20;
        color: var(--t-color, #ff5800);
    }
}

.checkin-state {
    &-3 {
        --op: 0.1;
        --t-color: #ff5800;
    }

    &-0 {
        --op: 1;
        --t-color: white;
    }

    &-2 {
        --op: 0.2;
        --t-color: #cc8864;
    }

    &-1 {
        --op: 0.4;
        --t-color: rgba(255, 88, 0, 0.7);
    }
}
</style>
