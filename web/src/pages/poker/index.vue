<script setup lang="ts">
import useLoadMore from '@/composables/useLoadMore'

const props = defineProps<{ loading: boolean, games: model.game.GamesObject }>()
const games = computed(() => props.loading ? [] : props.games.POKER)
</script>

<template>
    <div class="home-view">
           <GameTable title="ALL GAMES" :games="games"/>
    </div>
</template>

<style lang="scss"></style>
