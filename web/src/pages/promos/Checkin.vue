<script setup lang="ts">
import { doCheckIn, queryCheckin } from '@/api'
import useDelegate from '@/composables/useDelegate'
import { useQuery } from '@tanstack/vue-query'
import dayjs from 'dayjs'
import img1 from './assets/1.png'
import img2 from './assets/2.png'
import img3 from './assets/3.png'
import useAsyncFunction from '@/composables/useAsyncFunction'
import { rpx } from '@/utils/rpx'
import { Skeleton2 } from '@/components/skeleton'

const el = useTemplateRef<HTMLDivElement>('track')
const showRules = ref(false)

const { doing, todo } = useAsyncFunction(async function () {
    await doCheckIn()
    return refetch()
})


const { data, refetch, isPlaceholderData } = useQuery({
    queryKey: ['checkin_list'],
    queryFn: queryCheckin,
    placeholderData: [],
    select(data) {
        scrollIntoView()
        return data
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
    <div class="bg-white p-24 rd-16 bg-op-95 shadow-2xl">
        <h5 class="flex justify-between">
            <span class="font-semibold text-32">{{ $t('promos.name') }}</span>
            <button class="text-primary block expand-16" @click="showRules = true"><van-icon name="info-o" /></button>
        </h5>

        <!-- <Skeleton2 class="h-96 w-100" width="100" repeatable height="96" item-height="96" item-width="48">
            <rect x="2" y="16" rx="4" width="40" height="64" fill="#ccc" />
            <circle cx="22" cy="34" r="12" />
            <rect x="6" y="54" width="32" height="16" />
        </skeleton2> -->


        <div class="h-192 flex gap-16 overflow-scroll py-32 scroll-none" ref="track">
            <figure v-for="item in data" :key="item" class="checkin-item" :class="{ on: item.status === 1 }"
                :data-day="item.date">
                <img :src="item.status === 0 ? img1 : item.status === 1 ? img2 : img3" class="size-48" />
                <figcaption class="text-24">{{ dayjs(item.date).format('DD MMM') }}</figcaption>
            </figure>
        </div>
        <van-button type="danger" block :disabled="doing || isPlaceholderData" @click="todo">
            {{ $t('promos.confirm') }}
        </van-button>
    </div>
    <van-popup teleport="body" v-model:show="showRules" closeable position="bottom" class="p-32">
        <h6 class="font-semibold text-32">{{ $t("promos.checkin.title") }}</h6>
        <div class="mt-32 h-60vh overflow-auto whitespace-pre-line">{{ $t('promos.checkin.rules') }}</div>
    </van-popup>
</template>

<style lang="scss">
.checkin-item {
    @apply flex-shrink-0 w-80 h-128 bg-#eee rd-8 text-center py-12;

    &.on {
        background-color: #ff5800;
        color: white;
    }
}
</style>
