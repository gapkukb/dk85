<script setup lang="ts">
import { useQuery } from '@tanstack/vue-query';

const { isLoading, data } = useQuery({
    queryKey: ['Notification'],
    queryFn: () => Promise.delay(3000)
})

</script>

<template>
    
    <div v-if="!isLoading" class="grid gap-16 px-12 py-12">

        <div v-for="i in 10" class="grid gap-8 bg-white px-12 py-8 rd-4" @click="$router.push(`/message/${123}`)">
            <h4 class="font-medium text-16">2D lottery has begun in grand style</h4>
            <section class="line-clamp-2 text-12 text-#999">📅Prize Opening Time📅 Monday to Friday, 【Saturday and
                Sunday
                not included】 Opens twice a
                day
                【12:00 PM】 【16:40 PM】 2025's highest online compensation
                Maximum 95x
            </section>
            <div class="flex justify-end items-center gap-8">
                <p class="text-12 text-#aaa">2025-05-10 23:04:52</p>
                <van-icon name="arrow" size="12" color="#aaa"></van-icon>
            </div>
        </div>
    </div>

    <skeleton v-else repeatable fixed item-height="252" fill="#bbb" class="mt-12">
        <rect x="24" width="702" rx="8" ry="8" height="220" fill="#ddd" />
        <rect x="56" y="16" width="70%" height="40" />
        <rect x="56" y="70" width="85.5%" height="80" />
        <rect x="496" y="164" width="200" height="36" />

    </skeleton>
</template>

<style lang="scss"></style>