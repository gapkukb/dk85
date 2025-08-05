<script setup lang="ts">
import { asyncConfirmDeposit } from '@/api/funds.api';
import { queryActivities } from '@/api/promos.api';
import useAsyncFunction from '@/composables/useAsyncFunction';
import { useBack } from '@/composables/useBack';
import { URLHelper } from '@/helper/url';
import { formatter } from '@/utils/number';
import { useQuery } from '@tanstack/vue-query';
import { showToast, type FieldInstance } from 'vant';

const q = useRoute().query.q as any
const order = URLHelper.decode(q) as model.funds.PaymentResult & model.funds.PaymentChannel & { amount: string }
console.log(order);

const back = useBack()
const { isLoading, data } = useQuery({
    queryKey: ['diposit'],
    queryFn: queryActivities
})

const id = ref('')
const field = useTemplateRef<FieldInstance>("digits")

const { doing, successful, todo } = useAsyncFunction(async () => {
    await asyncConfirmDeposit({
        sys_trade_no: order.sys_trade_no,
        bank_serial: id.value,
        account_id: order.id,
    })
    showToast(t("funds.submitted"))
    back();
})

function confirm() {
    if (id.value.length !== 6) {
        showToast(t("form.placeholder.last6digitsOrder"))
        field.value!.focus()
        return
    }
    todo()
}

</script>

<template>
    <nav-bar :title="$t('funds.confirmation')" fixed>
        <template #right>
            <CustomerService />
        </template>
    </nav-bar>

    <div class="h-60"></div>
    <div class="flex items-center">
        <h3 class="font-semibold pl-32 pr-16">{{ $t("funds.rechargeDetail") }}</h3>
        <p class="bg-primary bg-op-10 rd-full px-12 py-4 lh-1">
            <van-icon name="info-o" color="#ff5800" />
            <span class="text-primary pl-8 text-24">{{ $t("funds.transferHere") }}</span>
        </p>
    </div>
    <div class="h-16"></div>

    <van-cell-group>
        <!-- Transfer here -->
        <van-cell :title="$t('funds.paymentMethod')" center class="!py-16 !lh-1">
            <div class="bg-#f5f5f5 rd-full inline-flex items-center py-4 pl-4 pr-12 gap-8">
                <img :src="order.logo" class="size-48 rd-full">
                <p class="text-28 font-semibold">{{ order.name }}</p>
            </div>
        </van-cell>
        <van-cell :title="$t('funds.receivingAccount')" title-class="!flex-none">
            <Clipboard :text="order.channel_card_no"><span class="font-semibold">{{ order.channel_card_no }}</span>
            </Clipboard>
        </van-cell>
        <van-cell :title="$t('funds.amount')">
            <span class="text-primary font-bold">{{ formatter.commatize(order.amount, 2) }}</span>
            MMK
        </van-cell>
    </van-cell-group>

    <div class="mt-32">
        <h3 class="font-semibold pl-32">{{ $t("funds.transactionId") }}
            <span class="text-red">({{ $t("app.required") }})</span>
        </h3>
        <div class="h-16"></div>
        <van-field v-model="id" ref="digits" :placeholder="$t('form.placeholder.last6digitsOrder')" type="digit"
            maxlength="6"></van-field>
        <h3 class="font-semibold pt-32 pb-16 pl-32">{{ $t("funds.recGuide") }}</h3>
        <img :src="order.image_url" class="block w-full">

    </div>
    <div class="h-152"></div>
    <div class="fixed bottom-0 left-0 right-0 p-32 bg-white">
        <van-button type="danger" block :disabled="doing" @click="confirm">{{ $t("app.confirm") }}</van-button>
    </div>
</template>

<style lang="scss"></style>