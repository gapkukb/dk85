<script setup lang="ts"></script>

<template>
    <div class="grid grid-rows-2 grid-cols-[64px_auto] gap-col-4 bg-#f5f5f5 rd-full h-full pr-15 items-center">
        <img
            src="@/assets/images/logo1.png"
            class="size-64 grid-row-span-2"
        />
        <h5 class="text-20 inline-flex items-center gap-8 pt-4">
            <span>ID:123456</span>
            <span class="bg-#ffa15f rd-4 text-16 px-8 font-semibold c-white">VIP1</span>
        </h5>
        <Balance
            balance-class="text-24 font-semibold"
            icon-class="text-20 text-white bg-#ff5029 rd-full p-4"
        />
    </div>
</template>

<style lang="scss" scoped></style>
