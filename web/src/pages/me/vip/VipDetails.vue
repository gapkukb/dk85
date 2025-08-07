<script setup lang="ts">
import levels from './levels.config';
import VipCard from './VipCard.vue';
import VipDetailsRight from './VipDetailsRight.vue';


</script>

<template>
    <NavBar :title="$t('page.vip')"/>
    <VipCard />
    <div class="grid gap-24 pt-32 fs-24">
        <VipDetailsRight v-for="(level, index) in levels" :key="level.level" :index="index" />
    </div>
</template>

<style lang="scss" scoped></style>