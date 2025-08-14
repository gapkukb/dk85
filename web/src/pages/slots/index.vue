<script setup lang="ts">
import { GamesHelper } from '@/shared/game-helper';
import { useQuery } from '@tanstack/vue-query';

const { isLoading, data: games } = useQuery({
    queryKey: ['slots'],
    queryFn: () => GamesHelper.queryByKind('SLOTS')
})
</script>

<template>
    <div class="home-view grid gap-8">
        <HomeBanner :position="2" />
        <div class="h-36"></div>
        <GameTable title="ALL GAMES" :games="games" />
        <!-- <div v-if="isLoading" class="">loading...</div>
        <template v-else>
            <GameTable title="Most Popular" />
            <GameTable title="Most collect" />
            <GameTable title="New Games" />
            <CateGames />
        </template> -->
    </div>
</template>

<style lang="scss"></style>
