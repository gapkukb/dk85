<script setup lang="ts">
import { queryActivities } from '@/api/promos.api';
import useStatefulFunc from '@/composables/use-stateful-func';
import useBalance from '@/composables/useBalance';
import { router } from '@/router';
import { useQuery } from '@tanstack/vue-query';
import type { FieldRule } from 'vant';

const props = defineProps<{ channel: any }>()
const minimum = 2000
const { balance } = useBalance()
const account = ref('')
const amount = ref('')
const accountRules: FieldRule[] = [{ required: true, message: t("form.error.required", { name: t("wallet.withdraw.account") }) }]
const amountRules: FieldRule[] = [{
    validator(value: number) {
        if (value < minimum) return t("wallet.withdraw.minimum") + ":" + minimum
        if (value > balance.value) return t("form.error.insufficient")

        return true
    }
}]

function allin() {
    amount.value = Math.floor(balance.value).toString()
}

const [todo, doing] = useStatefulFunc(async () => {
    await Promise.delay(1000)
    router.push({
        path: "/wallet/confirmation",
        query: props.channel
    })
})

</script>

<template>
    <van-form class="grid gap-8" @submit="todo">
        <h6 class="pt-8 text-12">{{ $t('wallet.withdraw.account') }}</h6>

        <van-field v-model.trim="account" name="account" autofocus class="van-field-solid withdraw-account-field"
            :placeholder="$t('form.placeholder.withdrawalAccount')" :rules="accountRules">
            <template #left-icon>
                <img :src="channel.image" class="absolute size-36 left-4 top-4 rd-full">
            </template>
        </van-field>



        <h6 class="pt-8 text-12">
            <span>{{ $t('wallet.withdraw.amount') }}</span>
            <span class="text-#999">({{ $t('wallet.withdraw.balance') }}:</span>
            <span class="text-primary font-bold px-6">{{ balance }}</span>
            <span class="text-#999">MMK)</span>
        </h6>
        <van-field v-model.number.trim="amount" name="amount" class="van-field-solid" type="digit"
            :placeholder="$t('form.placeholder.withdrawalAmount')" :rules="amountRules">
            <template #right-icon>
                <span class="font-semibold text-#111 px-16">MMK</span>
            </template>
            <template #extra>
                <van-button size="mini" type="danger" class="font-semibold" @click="allin">{{ $t('wallet.withdraw.all')
                }}</van-button>
            </template>
        </van-field>

        <div class="text-12 py-8 text-#999">
            <van-icon name="info-o" color="#ff5800" class="!font-bold"></van-icon>
            <span class="pl-8">{{ $t('wallet.withdraw.minimum') }}</span>
            <span class="text-primary font-bold px-4">{{ minimum }}</span>
            <span class="">MMK</span>
        </div>

        <div class="h-16"></div>
        <van-button type="danger" block :disabled="!account.length || doing" native-type="submit">
            {{ $t("app.confirm") }}
        </van-button>
        <div class="h-16"></div>
    </van-form>
</template>

<style lang="scss">
.withdraw-account-field {
    .van-field__control {
        text-indent: 2em;
    }
}
</style>