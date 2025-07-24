<script setup lang="ts">
import { queryActivities } from '@/api/promos.api';
import useAsyncFunction from '@/composables/useAsyncFunction';
import { useBack } from '@/composables/useBack';
import { formatter } from '@/utils/number';
import { useQuery } from '@tanstack/vue-query';
import { showToast, type FieldInstance } from 'vant';

const channel = useRoute().query as any
const back = useBack()
const { isLoading, data } = useQuery({
    queryKey: ['diposit'],
    queryFn: queryActivities
})

const id = ref('')
const field = useTemplateRef<FieldInstance>("digits")

const [todo, doing] = useAsyncFunction(async (id: string) => {
    await Promise.delay(1000)
    alert
})

function confirm() {
    if (id.value.length !== 6) {
        showToast(t("form.placeholder.last6digitsOrder"))
        field.value!.focus()
        return
    }

    todo(id.value)
}

</script>

<template>
    <nav-bar :title="$t('wallet.confirmation')" fixed>
        <template #right>
            <CustomerService />
        </template>
    </nav-bar>

    <div class="h-60"></div>
    <div class="flex items-center">
        <h3 class="font-semibold pl-16 pr-8">{{ $t("wallet.rechargeDetail") }}</h3>
        <p class="bg-primary bg-op-10 rd-full px-6 py-2 lh-1">
            <van-icon name="info-o" color="#ff5800" />
            <span class="text-primary pl-4 text-12">{{ $t("wallet.transferHere") }}</span>
        </p>
    </div>
    <div class="h-8"></div>

    <van-cell-group>
        <!-- Transfer here -->
        <van-cell :title="$t('wallet.paymentMethod')" center class="!py-8 !lh-1">
            <div class="bg-#f5f5f5 rd-full inline-flex items-center py-2 pl-2 pr-6 gap-4">
                <img :src="channel.image" class="size-24 rd-full">
                <p class="text-14 font-semibold">{{ channel.name }}</p>
            </div>
        </van-cell>
        <van-cell :title="$t('wallet.receivingAccount')" title-class="!flex-none">
            <Clipboard :text="channel.title"><span class="font-semibold">{{ channel.title }}</span></Clipboard>
        </van-cell>
        <van-cell :title="$t('wallet.amount')">
            <span class="text-primary font-bold">{{ formatter.commatize(channel.amount, 2) }}</span>
            MMK
        </van-cell>
    </van-cell-group>

    <div class="mt-16">
        <h3 class="font-semibold pl-16">{{ $t("wallet.transactionId") }}
            <span class="text-red">({{ $t("app.required") }})</span>
        </h3>
        <div class="h-8"></div>
        <van-field v-model="id" ref="digits" :placeholder="$t('form.placeholder.last6digitsOrder')" type="digit"
            maxlength="6"></van-field>
        <h3 class="font-semibold pt-16 pb-8 pl-16">{{ $t("wallet.recGuide") }}</h3>
        <img src="./assets/guide-kbz-pay.jpg" class="block w-full">

    </div>
    <div class="h-76"></div>
    <div class="fixed bottom-0 left-0 right-0 p-16 bg-white">
        <van-button type="danger" block :disabled="doing" @click="confirm">{{ $t("app.confirm") }}</van-button>
    </div>
</template>

<style lang="scss"></style>