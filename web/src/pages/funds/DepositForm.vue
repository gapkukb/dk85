<script setup lang="ts">
import { asyncDeposit } from '@/api/funds.api';
import useAsyncFunction from '@/composables/useAsyncFunction';
import { URLHelper } from '@/helper/url';
import { router } from '@/router';
import { showToast } from 'vant';

const props = defineProps<{ channel: model.funds.PaymentChannel }>()

const amount = ref('')
const { doing, successful, todo } = useAsyncFunction(async () => {
    const c = props.channel
    const result = await asyncDeposit({
        // 	string	支付接口ID
        account_id: c.id,
        //是	string	金额
        money: amount.value,
        // 	string	充值”recharge”、提现”withdrawal”
        order_type: "recharge",
        // 	string	提现时必填用户银行卡帐号
        // user_card_no: "",
        // 	string	提现时必填用户银行卡姓名
        user_card_name: "1",
        // 	string	优惠活动ID, 0无活动
        activity_id: "0",
        // 	string	是否手机端。1= 是；0= 否
        mobile: "1",
        // 	string	银行代码。可选
        // bank_value: "",
        // 	string	随机数。防止重复提交
        nonce: (Math.random() * Math.random()).toString(32).substring(2),
    }).then(({ code, result, ...data }) => {
        if (code !== 200) {
            showToast(result || 'unkown error!')
            return Promise.reject();
        }
        return data
    })

    const q = URLHelper.encode({
        ...toRaw(c),
        ...result,
        amount:amount.value
    })

    router.push({
        path: "/confirmation",
        query: {
            q
        }
    })
})

</script>

<template>
    <div class="grid gap-16">
        <h6 class="pt-32 text-24">{{ $t("funds.paymentMethod") }}</h6>
        <div class="bg-#f5f5f5 rd-full flex items-center py-8 pl-8 gap-16">
            <img :src="channel.logo" class="size-72 rd-full">
            <p class="text-32 font-semibold">{{ channel.name }}</p>
            <span v-if="channel.remark" class="text-16 px-8 bg-#FF8E09 lh-28 c-#fff">{{ channel.remark }}</span>
        </div>
        <h6 class="pt-32 text-24">{{ $t("funds.rechargeAmount") }}</h6>

        <div v-if="channel.is_input" class="grid gap-16 grid-cols-3">
            <van-button v-for="item in channel.moneyList" :key="item" type="danger" :plain="item != amount"
                @click="amount = item">{{ item }}</van-button>
        </div>

        <van-field v-model="amount" class="van-field-solid" type="digit">
            <template #extra><span class="font-semibold">MMK</span></template>
        </van-field>

        <div class="h-32"></div>

        <van-button type="danger" block :disabled="!amount.length || doing" @click="todo">
            {{ $t("app.confirm") }}
        </van-button>
        <div class="h-32"></div>
    </div>
</template>

<style lang="scss"></style>