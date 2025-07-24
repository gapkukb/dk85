<script setup lang="ts">
const props = defineProps<{ percentage: number | string, type: 'bet' | 'charge' }>()
const title = props.type === 'bet' ? '投注要求' : '充值要求'
</script>

<template>
    <div class="flex-1">
        <p class="vip-card-text">{{ title }}</p>
        <van-progress :percentage="percentage" :pivot-text="`${percentage}%`" pivot-color="#BB684D" track-color=""
            color="linear-gradient(to right, #552F23, #BB684D)" style="margin: 4px 0;" />
        <p class="vip-card-text">
            <span class="font-medium">10,000.00</span>
            <span class="op-80">/10,000.00</span>
        </p>
    </div>
</template>
