<script setup lang="ts">
import useQueryGameList from '@/composables/useQueryGameList';
import CateGames from './CateGames.vue'
import { GAME_TYPE } from '@/constants/game.const';

const props = defineProps<{ loading: boolean, games: model.game.GamesObject }>()
const games = computed(() => props.loading ? [] : props.games.SLOTS)
</script>

<template>
    <div class="home-view grid gap-8">
        <!-- 
        <div class="grid gap-8 grid-cols-2 grid-rows-[115_80]">
            <div class="grid-col-span-2">
                <img src="../home/assets/images/9.png" class="size-full object-cover rd-8" />
            </div>
            <div>
                <img src="../home/assets/images/9.png" class="size-full object-cover rd-8" />
            </div>
            <div>
                <img src="../home/assets/images/9.png" class="size-full object-cover rd-8" />
            </div>
        </div> 
        -->
        
        <div class="h-16"></div>
           <GameTable title="ALL GAMES" :games="games"/>
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
