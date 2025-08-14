<script setup lang="ts">
import { queryPaymentList } from '@/api/funds.api';
import { useQuery } from '@tanstack/vue-query';
import DepositForm from './DepositForm.vue';
import Channel from './Channel.vue';

const { isLoading, data: channels } = useQuery({
    queryKey: ['diposit'],
    queryFn: () => queryPaymentList(),
    select(data) {
        return Object.values(data).map(i => i.account_list[0])
    },
})

const next = ref(false)
const channel = ref<model.funds.Channel>()



function deposit(index: number) {
    channel.value = channels.value![index]
    next.value = true
}
</script>

<template>
    <div class="" v-if="isLoading">Loading</div>
    <div class="" v-else-if="!channels || channels.length === 0">empty</div>
    <van-cell-group v-else class="m-24">
        <Channel v-for="(channel, index) in channels" :channel="channel" @click="deposit(index)">
            <template #icon>
                <img :src="channel.logo" class="size-48 scale-120 object-cover rd-full">
            </template>

        </channel>
    </van-cell-group>

    <VanPopup teleport="body" v-model:show="next" position="bottom" title="Recharge Details" closeable
        class="pt-28 px-24">
        <div class="flex justify-between items-center pr-24">
            <h6 class="font-semibold text-32">{{ $t("funds.rechargeDetail") }}</h6>
            <CustomerService class="text-36 px-32" />
        </div>
        <DepositForm :channel="channel!" @close="channel = undefined" />
    </VanPopup>
</template>

<style lang="scss">
.page-deposit {
    --van-cell-right-icon-color: #FF5800;
}
</style>