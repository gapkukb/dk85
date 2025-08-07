<script setup lang="ts">
import { useQuery } from '@tanstack/vue-query'

const { isLoading, data } = useQuery({
    queryKey: ['message'],
    placeholderData:[],
    queryFn: () => Promise.delay(3000),
})
</script>

<template>
    <div
        class="grid gap-32 pb-24"
        @click="$router.push('/message/123')"
    >
        <div
            v-for="i in 10"
            class="grid gap-16 bg-white px-24 py-16 rd-8"
        >
            <h4 class="font-medium text-32">2D lottery has begun in grand style</h4>
            <section class="line-clamp-2 text-24 text-#999">
                📅Prize Opening Time📅 Monday to Friday, 【Saturday and Sunday not included】 Opens twice a day 【12:00 PM】 【16:40 PM】 2025's highest online
                compensation Maximum 95x
            </section>
            <div class="flex justify-end items-center gap-8">
                <p class="text-24 text-#aaa">2025-05-10 23:04:52</p>
                <van-icon
                    name="arrow"
                    size="12"
                    color="#aaa"
                ></van-icon>
            </div>
        </div>
    </div>
</template>

<style lang="scss"></style>
