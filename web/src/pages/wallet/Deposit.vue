<script setup lang="ts">
import { queryActivities } from '@/api/promos.api';
import { useQuery } from '@tanstack/vue-query';
import DepositForm from './DepositForm.vue';

const { isLoading, data } = useQuery({
    queryKey: ['diposit'],
    queryFn: queryActivities
})

const showChannel = ref(false)
const channel = ref<any>()

function deposit(index: number) {
    channel.value = data.value[index]
    showChannel.value = true
}
</script>

<template>
    <div class="" v-if="isLoading">Loading</div>
    <van-cell-group v-else>
        <van-cell v-for="(channel, index) in data" :title="channel.name" is-link center title-class="pl-8 font-semibold"
            @click="deposit(index)">
            <template #icon>
                <img :src="channel.image" class="size-36 object-cover rd-full">
            </template>

        </van-cell>
    </van-cell-group>

    <VanPopup teleport="body" v-model:show="showChannel" position="bottom" title="Recharge Details" closeable class="pt-14 px-12">
        <div class="flex justify-between items-center pr-24">
            <h6 class="font-semibold text-16">{{ $t("wallet.rechargeDetail") }}</h6>
            <CustomerService class="text-18 px-16" />
        </div>
        <DepositForm :channel="channel" @close="channel = undefined" />
    </VanPopup>
</template>

<style lang="scss"></style>