<script setup lang="ts">
import { GamesHelper } from '@/shared/game-helper';
import { useQuery } from '@tanstack/vue-query';

const { isLoading, data: games } = useQuery({
    queryKey: ['foru'],
    queryFn: () => GamesHelper.queryByKind('SLOTS1')
})
</script>

<template>
    <div class="home-view">
        <HomeBanner :position="1" />
        <div class="h-36"></div>
        <GameTable title="ALL GAMES" :games="games" />
    </div>
</template>

<style lang="scss"></style>
