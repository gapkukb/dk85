<script setup lang="ts">
import CateGames from './CateGames.vue'
</script>

<template>
    <div class="home-view grid gap-8">
        <div class="grid gap-8 grid-cols-2 grid-rows-[115_80]">
            <div class="grid-col-span-2">
                <img
                    src="../home/assets/images/9.png"
                    class="size-full object-cover rd-8"
                />
            </div>
            <div>
                <img
                    src="../home/assets/images/9.png"
                    class="size-full object-cover rd-8"
                />
            </div>
            <div>
                <img
                    src="../home/assets/images/9.png"
                    class="size-full object-cover rd-8"
                />
            </div>
        </div>

        <GameTable title="Most Popular" />
        <GameTable title="Most collect" />
        <GameTable title="New Games" />

        <CateGames />
    </div>
</template>

<style lang="scss">

</style>
