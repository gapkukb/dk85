<script setup lang="ts">
import { queryClainmedList } from '@/api/promos.api';
import { useQuery } from '@tanstack/vue-query';

const show = ref(false)

const { isLoading, data } = useQuery({
    queryKey: ['clainmed_list'],
    queryFn: queryClainmedList,
    enabled: show
})
</script>

<template>
    <button class="absolute right--8 top-24 text-white bg-primary text-24 font-bold px-32 py-8 rd-l-full"
        @click="show = true">
        {{ $t("promos.record") }}
    </button>
    <van-popup v-model:show="show" teleport="body" position="bottom" closeable class="py-32">
        <h6 class="flex justify-between items-center pr-112 text-32 font-semibold px-32">
            <span class=""> {{ $t("promos.record") }}</span>
            <CustomerService @called="show = false" />
        </h6>
        <p class="text-24 text-#999 px-32">{{ $t("promos.desc") }}</p>
        <div class="h-32"></div>
        <div class="h-60vh overflow-auto">
            <van-cell-group v-if="data?.length" :border="true">
                <van-cell v-for="item in data" :title="item.title" :label="item.dateTime" center><span
                        class="text-48 text-primary font-bold">{{ item.amount }}</span></van-cell>

            </van-cell-group>
            <van-empty v-else-if="!isLoading" image="error" :description="$t('promos.empty')" />
        </div>
    </van-popup>
</template>

<style lang="scss"></style>