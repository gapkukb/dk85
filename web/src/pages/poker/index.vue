<script setup lang="ts">
import { GamesHelper } from '@/shared/game-helper';
import { useQuery } from '@tanstack/vue-query';

// FISH
// MINI
// POKER
// SLOTS
const { isLoading, data: games } = useQuery({
    queryKey: ['POKER'],
    queryFn: () => GamesHelper.queryByKind('POKER')
})
</script>

<template>
    <div class="home-view">
        <HomeBanner :type="3" :position="4" />
        <div class="h-36"></div>
        <GameTable title="ALL GAMES" :games="games" />
    </div>
</template>

<style lang="scss"></style>
