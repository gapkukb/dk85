<script setup lang="ts">
import { GamesHelper } from '@/shared/game-helper';
import { useQuery } from '@tanstack/vue-query';


const { isLoading, data: games } = useQuery({
    queryKey: ['FISH'],
    queryFn: () => GamesHelper.queryByKind('FISH')
})

</script>

<template>
    <div class="home-view">
        <HomeBanner :type="3" :position="3" />
        <div class="h-36"></div>
        <GameTable title="ALL GAMES" :games="games" />
    </div>
</template>

<style lang="scss"></style>
