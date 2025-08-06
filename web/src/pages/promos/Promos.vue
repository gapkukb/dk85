<script setup lang="ts">
import { queryActivities } from '@/api/promos.api'
import useDelegate from '@/composables/useDelegate'
import { useQuery } from '@tanstack/vue-query'
import { showToast } from 'vant'

const { data } = useQuery({
    queryKey: ['activities'],
    queryFn: () => [
        {
            activityId: 21,
            title: '🎁လော့အင်အတွက်ဆုကြီးရယူပါ🎁',
            imgUrl: 'https://img.okszckoo.com/upload/images/202504/ecfe2b58-8a11-46cb-a21f-6decb5676fef.jpg',
            content: '<img src="https://img.okszckoo.com/upload/images/202504/56c70d15-6330-4728-ab83-6f08391504cb.jpg" alt="" />',
        },
        {
            activityId: 14,
            title: '💰နေ့စဉ်ဝင်ရောက်ခြင်း ဆုလာဘ်မျာ💰',
            imgUrl: 'https://img.okszckoo.com/upload/images/202504/a8854f98-d8e2-4587-ad0d-e2f0c4a4b840.jpg',
            content: '<img src="https://img.okszckoo.com/upload/images/202504/d934ab2e-c534-4964-b092-4d7e850e861e.jpg" alt="" />',
        },
        {
            activityId: 15,
            title: '🎉လောင်းကြေးပြန်အမ်းငွေ🎉',
            imgUrl: 'https://img.okszckoo.com/upload/images/202504/a58102e2-102b-4473-bb17-bffbf986b74a.jpg',
            content: '<img src="https://img.okszckoo.com/upload/images/202504/fdd3d7ba-f356-49a4-aa8b-fbcd0c212b7b.jpg" alt="" />',
        },
        {
            activityId: 16,
            title: '💎VIP အဆင့်မြှင့်တင်ခြင်း ဆုလာဘ်များ💎',
            imgUrl: 'https://img.okszckoo.com/upload/images/202504/dad44e46-bf1d-4d10-9fdb-dcb09c57f470.jpg',
            content: '<img src="https://img.okszckoo.com/upload/images/202504/47884f6f-662a-4ca0-8748-7a36bb7ee6ee.jpg" alt="" />',
        },
    ],
    shallow: true,
    placeholderData: [],
})

const todo = useDelegate('data-index', (value) => {
    const current = data.value[value]
    showToast(JSON.stringify(current))
})
</script>

<template>
    <div
        class="grid gap-16"
        @click="todo"
    >
        <button
            v-for="(item, index) in data"
            class="block w-full h-278"
            :data-index="index"
        >
            <img
                v-lazy="item.imgUrl"
                class="size-full rd-16 object-cover"
            />
        </button>
    </div>
</template>

<style lang="scss"></style>
