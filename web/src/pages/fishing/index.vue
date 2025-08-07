<script setup lang="ts">
import useLoadMore from '@/composables/useLoadMore'
import useQueryGameList from '@/composables/useQueryGameList';
import { GAME_TYPE } from '@/constants/game.const';

const props = defineProps<{ loading: boolean, games: model.game.GamesObject }>()
const games = computed(() => props.loading ? [] : props.games.FISH)
</script>

<template>
    <div class="home-view">
         <HomeBanner :position="3" />
        <div class="h-36"></div>
        <GameTable title="ALL GAMES" :games="games"/>
    </div>
</template>

<style lang="scss"></style>
