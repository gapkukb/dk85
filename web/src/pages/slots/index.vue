<script setup lang="ts">
import useQueryGameList from '@/composables/useQueryGameList';
import CateGames from './CateGames.vue'
import { GAME_TYPE } from '@/constants/game.const';

const props = defineProps<{ loading: boolean, games: model.game.GamesObject }>()
const games = computed(() => props.loading ? [] : props.games.SLOTS)
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
