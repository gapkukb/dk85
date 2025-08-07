<script setup lang="ts">
const props = defineProps<{ loading: boolean, games: model.game.GamesObject }>()
const games = computed(() => props.loading ? [] : props.games.POKER)
</script>

<template>
    <div class="home-view">
        <HomeBanner :position="4" />
        <div class="h-36"></div>
        <GameTable title="ALL GAMES" :games="games" />
    </div>
</template>

<style lang="scss"></style>
