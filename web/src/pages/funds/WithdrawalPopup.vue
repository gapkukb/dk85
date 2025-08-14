<script setup lang="ts">
import { withdraw } from '@/api';
import useStatefulFunc from '@/composables/use-stateful-func';
import useBalance from '@/composables/useBalance';
import { showSuccessToast, type FieldRule } from 'vant';

const props = defineProps<{ channel: model.funds.Channel }>()
const emit = defineEmits<{ finished: [] }>()
const { balance, formattedBalance, refresh } = useBalance()
const account = ref('')
const amount = ref()
const minimum = computed(() => Number(props.channel.each_min))
const maximum = computed(() => Number(props.channel.each_max))
const accountRules: FieldRule[] = [{ required: true, message: t("form.error.required", { name: t("funds.withdraw.account") }) }]
const amountRules: FieldRule[] = [{
    validator(value: number) {
        if (value > maximum.value) return t("funds.withdraw.minimum") + ":" + maximum.value
        if (value < minimum.value) return t("funds.withdraw.minimum") + ":" + minimum.value
        if (value > balance.value) return t("form.error.insufficient")

        return true
    }
}]

function allin() {
    amount.value = Math.floor(balance.value).toString()
}

const [todo, doing] = useStatefulFunc(async (values: any) => {
    await withdraw({
        ...values,
        withdraw_id: props.channel.id,
    })
    showSuccessToast('提款申请已受理')
    refresh()
    emit('finished')
})


</script>

<template>
    <van-form class="grid gap-24" @submit="todo">
        <h6 class="pt-16 text-24">{{ $t('funds.withdraw.account') }}</h6>

        <van-field v-model.trim="account" name="card_no" autofocus class="van-field-solid withdraw-account-field"
            :placeholder="$t('form.placeholder.withdrawalAccount')" :rules="accountRules">
            <template #left-icon>
                <img :src="channel.logo" class="size-48 !scale-120 rd-full">
            </template>
        </van-field>



        <h6 class="pt-16 text-24">
            <span>{{ $t('funds.withdraw.amount') }}</span>
            <span class="text-#999">({{ $t('funds.withdraw.balance') }}:</span>
            <span class="text-primary font-bold px-6">{{ formattedBalance }}</span>
            <span class="text-#999">MMK)</span>
        </h6>
        <van-field v-model.number.trim="amount" name="money" class="van-field-solid" type="digit"
            :placeholder="$t('form.placeholder.withdrawalAmount')" :rules="amountRules">
            <template #right-icon>
                <span class="font-semibold text-#111 px-32">MMK</span>
            </template>
            <template #extra>
                <van-button size="mini" type="danger" class="font-semibold" @click="allin">{{ $t('funds.withdraw.all')
                    }}</van-button>
            </template>
        </van-field>

        <div class="text-24 py-16 text-#999">
            <van-icon name="info-o" color="#ff5800" class="!font-bold"></van-icon>
            <span class="pl-16">{{ $t('funds.withdraw.minimum') }}</span>
            <span class="text-primary font-bold px-4">{{ minimum }}</span>
            <span class="">MMK</span>
        </div>

        <div class="h-24"></div>
        <van-button type="danger" block :disabled="doing" native-type="submit">
            {{ $t("app.confirm") }}
        </van-button>
    </van-form>
</template>

<style lang="scss">
.withdraw-account-field {
    .van-field__control {
        text-indent: 1em;
    }
}
</style>