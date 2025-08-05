<script setup lang="ts">
import { queryPaymentList } from '@/api/funds.api';
import { useQuery } from '@tanstack/vue-query';
import DepositForm from './DepositForm.vue';

const { isLoading, data } = useQuery({
    queryKey: ['diposit'],
    queryFn: () => queryPaymentList(),
    select(data) {
        return Object.values(data).map(i => i.account_list[0])
    },
})

const next = ref(false)
const channel = ref<model.funds.PaymentChannel>()



function deposit(index: number) {
    channel.value = data.value![index]
    next.value = true
}
</script>

<template>
    <div class="" v-if="isLoading">Loading</div>
    <div class="" v-else-if="!data || data.length === 0">empty</div>
    <div v-else class="bg-#eef2f5 grid gap-24 pt-40 px-24">
        <van-cell v-for="(channel, index) in data" :title="channel.name" is-link center title-class="pl-16 font-semibold"
            class="h-112 rd-16" @click="deposit(index)">
            <template #icon>
                <img :src="channel.logo" class="size-72 object-cover rd-full">
            </template>

        </van-cell>
    </div>

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