<script setup lang="ts">

</script>

<template>
    <nav-bar :title="$t('page.turnover')">
        <template #right>
            <router-link to="/turnover/history"><button @click="" class="text-20"><van-icon name="todo-list-o" /></button></router-link>
        </template>
    </nav-bar>

    <footer class="h-46">
        <div class="fixed bottom-0 left-0 right-0 flex gap-32 items-center justify-center h-40 bg-#e34f01 c-white">
            <div class="">
                <span class="op-80">Total Bets:</span>
                <b class="font-bold text-18 pl-4">0.00</b>
            </div>
            <div class="">
                <span class="op-80">Cash washing amount：</span>
                <b class="font-bold text-18 pl-4">0.00</b>
            </div>
        </div>
    </footer>
</template>

<style lang="scss" scoped></style>