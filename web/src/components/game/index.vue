<script setup lang="ts">
import { formatter } from '@/utils/number'

defineProps<{ poster: string; name: string; platformName: string; count?: number; index: number }>()

const isFav = ref(false)
</script>

<template>
    <div class="game-card" :data-game-index="index">
        <van-image class="game-card-thumb" :src="poster" lazy-load />

        <div class="game-card-detail">
            <h6 class="game-card-name">{{ name }}</h6>
            <!-- <p class="game__likes">{{ formatter.shorten(40012312) }} {{ $t('app.like') }}</p> -->
            <button class="game-card-fav" data-fav-index="1" @click="isFav = !isFav">
                <van-icon :name="isFav ? 'like' : 'like-o'" :color="isFav ? 'text-#ff5800' : undefined"
                    :class="{ 'text-#ff5800 animate': isFav }" />
            </button>
        </div>
        <span class="game-card-platform">{{ platformName }}</span>
    </div>
</template>

<style lang="scss">
.game-card {
    @apply grid relative;
    overflow: hidden;
    border-radius: 8px;
    padding-bottom: 8px;
    background-color: #fff;
    transition: transform 300ms, box-shadow 300ms;
    box-shadow: inset #aaa 0 0 1px 0;

    &:active {
        transform: scale3d(0.95, 0.95, 1);
    }

    &-thumb {
        @apply block w-full aspect-ratio-square object-cover;
    }

    &-bio {
        // @apply block w-full aspect-ratio-square object-cover;
        // box-shadow: red 0 0 1px 0;
    }

    &-name {
        @apply flex-1 text-0.85em truncate px-0.28em font-medium;
    }

    &-detail {
        @apply flex justify-between items-center px-0.28em min-w-0 h-48;
    }

    &__likes {
        @apply text-0.71em text-#8286a3;
    }

    &-fav {
        @apply text-0.85em p-0.57em flex-shrink-0;

        .animate {
            animation: fav-animation 2s cubic-bezier(0.68, -0.55, 0.27, 1.55);
        }
    }

    &-platform {
        @apply absolute z-1 right-0 top-0 text-0.71em bg-#00000080 text-white font-semibold px-0.85em rd-bl-0.28em;
    }
}

@keyframes fav-animation {
    to {
        transform: scale3d(1.8, 1.8, 1);
    }
}
</style>
