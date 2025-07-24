<script setup lang="ts">
import levels from './levels.config';
import VipCard from './VipCard.vue';
import VipDetailsRight from './VipDetailsRight.vue';


</script>

<template>
    <VipCard />
    <div class="grid gap-8 pt-16 fs-12">
        <VipDetailsRight v-for="(level, index) in levels" :key="level.level" :index="index" />
    </div>
</template>

<style lang="scss" scoped></style>