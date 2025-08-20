<script setup lang="ts">
import { queryGameRecord } from '@/api';
import { usePagination2 } from '@/composables/usePagination';
import dayjs from 'dayjs';

const start = ref(dayjs().subtract(30, 'days').format("YYYY-MM-DD 00:00:00"))
const end = dayjs().format("YYYY-MM-DD 23:59:59")


const { finished, list, loading, page, load } = usePagination2({
    loader(page, size) {
        return queryGameRecord({
            page: page,
            size: 50,
            start_date: start.value,
            end_date: end,
            platform: "one_api_game"
        });
    }
})

</script>

<template>
    <van-list v-model:loading="loading" :finished="finished" finished-text="没有更多了" @load="load"
        offset="0" :immediate-check="false">
        <van-cell-group>
            <van-cell v-for="item in list" title="ပလက်ဖောင်းငွေရလွှဲမှု" label="2025/08/11 16:25:30" center>
                <span class="c-primary font-600">-28.00</span>
                <template #extra></template>
            </van-cell>
        </van-cell-group>
    </van-list>

</template>

<style lang="scss"></style>