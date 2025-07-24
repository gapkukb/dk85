<script setup lang="ts">
import { queryActivities } from '@/api/promos.api';
import useAsyncFunction from '@/composables/useAsyncFunction';
import { router } from '@/router';
import { useQuery } from '@tanstack/vue-query';

const props = defineProps<{ channel: any }>()

const { isLoading, data: presets } = useQuery({
    queryKey: ['diposit_presets'],
    queryFn: async () => {
        await Promise.delay(1000)
        return [2000, 5000, 10000, 50000, 1000000]
    }
})

const amount = ref('')
const [todo, doing] = useAsyncFunction(async () => {
    await Promise.delay(1000)
    router.push({
        path: "/wallet/confirmation",
        query: props.channel
    })
})

</script>

<template>
    <div class="grid gap-8">
        <h6 class="pt-16 text-12">{{ $t("wallet.rechargeDetail") }}</h6>
        <div class="bg-#f5f5f5 rd-full flex items-center py-4 pl-4 gap-8">
            <img :src="channel.image" class="size-36 rd-full">
            <p class="text-16 font-semibold">{{ channel.name }}</p>
            <span class="text-8 px-4 bg-#FF8E09 lh-14 c-#fff">最高赠送2500</span>
        </div>
        <h6 class="pt-16 text-12">{{ $t("wallet.rechargeAmount") }}</h6>
        <div class="grid gap-8 grid-cols-3">
            <van-button v-for="item in presets" :key="item" type="danger" :plain="item != amount"
                @click="amount = item.toString()">{{ item }}</van-button>
        </div>

        <van-field v-model="amount" class="van-field-solid">
            <template #extra><span class="font-semibold">MMK</span></template>
        </van-field>

        <van-button type="danger" block :disabled="!amount.length || doing" @click="todo">
            {{ $t("app.confirm") }}
        </van-button>
        <div class="h-16"></div>
    </div>
</template>

<style lang="scss"></style>