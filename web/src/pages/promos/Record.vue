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
    <button class="absolute right--4 top-12 text-white bg-primary text-12 font-bold px-16 py-4 rd-l-full"
        @click="show = true">
        {{ $t("promos.record") }}
    </button>
    <van-popup v-model:show="show" teleport="body" position="bottom" closeable class="py-16">
        <h6 class="flex justify-between items-center pr-56 text-16 font-semibold px-16">
            <span class=""> {{ $t("promos.record") }}</span>
            <CustomerService @called="show = false" />
        </h6>
        <p class="text-12 text-#999 px-16">{{ $t("promos.desc") }}</p>
        <div class="h-16"></div>
        <div class="h-60vh overflow-auto">
            <van-cell-group v-if="data?.length" :border="true">
                <van-cell v-for="item in data" :title="item.title" :label="item.dateTime" center><span
                        class="text-24 text-primary font-bold">{{ item.amount }}</span></van-cell>

            </van-cell-group>
            <van-empty v-else-if="!isLoading" image="error" :description="$t('promos.empty')" />
        </div>
    </van-popup>
</template>

<style lang="scss"></style>