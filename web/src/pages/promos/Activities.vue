<script setup lang="ts">
import { queryActivities } from '@/api/promos.api';
import useDelegate from '@/composables/useDelegate';
import { useQuery } from '@tanstack/vue-query';
import { showToast } from 'vant';

const { data } = useQuery({
    queryKey: ['activities'],
    queryFn: queryActivities,
    shallow: true,
    placeholderData: []
})

const todo = useDelegate('data-index', value => {
    const current = data.value[value]
    showToast(JSON.stringify(current))
})

</script>

<template>
    <div class="grid gap-16" @click="todo">
        <button v-for="(item, index) in data" class="block w-full h-84" :data-index="index">
            <img v-lazy="item.url" class="size-full rd-8 object-cover">
        </button>
    </div>
</template>

<style lang="scss" scoped></style>