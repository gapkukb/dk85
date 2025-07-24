<script setup lang="ts">

</script>

<template>
    <dl class="">
        <dt class="text-16 font-semibold">Most Popular</dt>
        <dd v-for="(item, index) in 10" class="flex gap-8 min-w-0">
            <span class="w-12 text-right -ml-4 flex-shrink-0"
                :class="{ 'text-blueGray': index == 0, 'text-orange': index == 1, 'text-cyan': index == 2 }">{{ index + 1
                }}</span>
            <img src="https://fastly.jsdelivr.net/npm/@vant/assets/ipad.jpeg" class="size-40 rd-4 object-cover">
            <div class="min-w-0">
                <h6 class="text-14 truncate">商品标题商品标题商品标题商品标题商品标题商品标题商品标题商品标题</h6>
                <p class="text-#ccc text-12 truncate">描述信息描述信息描述信息描述信息描述信息描述信息描述信息描述信息描述信息</p>
            </div>
        </dd>
    </dl>
</template>
