<script setup lang="ts"></script>

<template>
    <div class="grid grid-rows-2 grid-cols-[32px_auto] gap-col-4 bg-#f5f5f5 rd-full h-full pr-8 items-center">
        <img
            src="@/assets/images/logo1.png"
            class="size-32 grid-row-span-2"
        />
        <h5 class="text-10 inline-flex items-center gap-4 pt-2">
            <span>ID:123456</span>
            <span class="bg-#ffa15f rd-2 text-8 px-4 font-semibold c-white">VIP1</span>
        </h5>
        <Balance
            balance-class="text-12 font-semibold"
            icon-class="text-10 text-white bg-#ff5029 rd-full p-2"
        />
    </div>
</template>

<style lang="scss" scoped></style>
