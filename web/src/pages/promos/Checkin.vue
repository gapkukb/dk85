<script setup lang="ts">
import useDelegate from '@/composables/useDelegate'
import { useQuery } from '@tanstack/vue-query'
import dayjs from 'dayjs'
import img1 from './assets/coin-0.webp'
import img2 from './assets/coin-1.webp'
import img3 from './assets/coin-2.webp'
import useAsyncFunction from '@/composables/useAsyncFunction'
import mock from './mock.json'
const el = useTemplateRef<HTMLDivElement>('track')
const showRules = ref(false)

const { doing, todo } = useAsyncFunction(async function () {
    // await doCheckIn()
    return refetch()
})

const { data, refetch, isPlaceholderData } = useQuery({
    queryKey: ['checkin_list'],
    // queryFn: queryCheckin,
    queryFn: () => mock,
    placeholderData: [],
    select(data) {
        scrollIntoView()
        return mock
    },
})

function scrollIntoView() {
    nextTick(() => {
        el.value?.querySelector('.on')?.scrollIntoView({
            behavior: 'instant',
            inline: 'center',
        })
    })
}
</script>

<template>
    <div class="bg-white p-24 rd-16 bg-op-95">
        <h5 class="flex justify-between">
            <span class="font-semibold text-32">{{ $t('promos.name') }}</span>
            <button
                class="text-primary block expand-16"
                @click="showRules = true"
            >
                <van-icon name="info-o" />
            </button>
        </h5>

        <div
            class="h-192 flex gap-8 overflow-scroll py-32 scroll-none"
            ref="track"
        >
            <figure
                v-for="item in data"
                :key="item"
                class="checkin-date"
                :class="{ on: item.status === 1 }"
                :data-day="item.date"
            >
                <img
                    :src="item.status === 0 ? img1 : item.status === 1 ? img2 : img3"
                    class="size-64"
                />
                <figcaption class="checkin-date-text">{{ dayjs(item.date).format('DD MMM') }}</figcaption>
            </figure>
        </div>
        <van-button
            type="danger"
            block
            :disabled="doing || isPlaceholderData"
            @click="todo"
        >
            {{ $t('promos.confirm') }}
        </van-button>
    </div>
    <van-popup
        teleport="body"
        v-model:show="showRules"
        closeable
        position="bottom"
        class="p-32"
    >
        <h6 class="font-semibold text-32">{{ $t('promos.checkin.title') }}</h6>
        <div class="mt-32 h-60vh overflow-auto whitespace-pre-line">{{ $t('promos.checkin.rules') }}</div>
    </van-popup>
</template>

<style lang="scss">
.claimed {
    --op: 0.4;
    --t-color: rgba(#ff5800, 0.7);
}

.expired {
    --op: 0.2;
    --t-color: #cc8864;
}

.running {
    --op: 1;
    --t-color: white;
}

.checkin-date {
    --color: rgba(255, 88, 0, var(--op, 0.1));

    @apply flex-shrink-0 w-86 h-128 rd-8 text-center py-12;
    background: linear-gradient(0deg, var(--color), var(--color)),
        radial-gradient(710.82% 50% at 13.62% 0%, rgba(255, 255, 255, 0.301) 0%, rgba(255, 230, 215, 0.0001) 100%);

    &-text {
        @apply text-20;
        color: var(--t-color, #ff5800);
    }
}
</style>
