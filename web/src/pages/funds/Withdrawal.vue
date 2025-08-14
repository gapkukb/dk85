<script setup lang="ts">
import { useQuery } from '@tanstack/vue-query';
import WithdrawalPopup from './WithdrawalPopup.vue';
import { queryWithdrawalChannels } from '@/api';
import Channel from './Channel.vue';

const { isLoading, data: channels } = useQuery<model.funds.Channel[]>({
    queryKey: ['withdraw'],
    queryFn: () => queryWithdrawalChannels()
})
const show = ref(false)
const channel = ref<any>()

function withdraw(index: number) {
    channel.value = channels.value![index]
    show.value = true
}
</script>

<template>
    <div class="" v-if="isLoading">Loading</div>
    <div class="" v-else-if="!channels || channels.length === 0">empty</div>
    <van-cell-group v-else class="m-24">
        <Channel v-for="(channel, index) in channels" :channel="channel" @click="withdraw(index)">
            <template #icon>
                <img :src="channel.logo" class="size-48 scale-120 object-cover rd-full">
            </template>
        </channel>
    </van-cell-group>
    <VanPopup teleport="body" v-model:show="show" position="bottom" closeable class="p-24">
        <div class="flex justify-between items-center pr-48">
            <h6 class="font-semibold text-32">{{ channel.name }}</h6>
            <CustomerService class="text-36 px-32" />
        </div>
        <WithdrawalPopup :channel="channel" @close="channel = undefined" @finished="show = false" />
    </VanPopup>
</template>

<style lang="scss"></style>