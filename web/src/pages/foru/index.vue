<script setup lang="ts">
import { rpx } from '@/utils/rpx'
import img from '../home/assets/images/9.png'
import { useTimeout } from '@vueuse/core'
import usePlayGame from '@/composables/usePlayGame'

const props = defineProps<{ loading: boolean, games: model.game.GamesObject }>()
const height = rpx(120)
const banners = shallowRef<string[]>([])
const playGame = usePlayGame([1, 2, 3, 4, 5])
useTimeout(3000, {
    callback() {
        banners.value = Array.from<string>({ length: 6 }).fill(img)
    },
})

const games = computed(() => props.loading ? [] : props.games.SLOTS)

</script>

<template>
    <div class="home-view">
        <Skeleton v-if="banners.length === 0" :height="height" />
        <van-swipe v-else :autoplay="3000" indicator-color="white" :height="height">
            <van-swipe-item v-for="item in 5" :key="item">
                <img src="../home/assets/images/9.png" class="size-full object-cover rd-8" />
            </van-swipe-item>
        </van-swipe>
        <div class="h-8"></div>

        <!-- <div class="bg-white game-list rd-4">
            <h4 class="game-list-title">Featured games</h4>
            <div class="flex overflow-auto gap-4" @touchstart.stop="">
                <Game v-for="i in 40" class="flex-shrink-0 w-80 text-12" />
            </div>
        </div>
         -->
        <div class="h-8"></div>
        <GameTable title="ALL GAMES" :games="games" />
    </div>
</template>

<style lang="scss"></style>
