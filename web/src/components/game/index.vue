<script setup lang="ts">
import { formatter } from '@/utils/number'

defineProps<{ poster: string; name: string; platformName: string; count?: number; index: number }>()

const isFav = ref(false)
</script>

<template>
    <figure class="game" :data-game-index="index">
        <van-image class="game__thumb" :src="poster" lazy-load />

        <div class="game__stat">
            <h6 class="game__name">{{ name }}</h6>
            <!-- <p class="game__likes">{{ formatter.shorten(40012312) }} {{ $t('app.like') }}</p> -->
            <button class="game__fav" data-fav-index="1" @click="isFav = !isFav">
                <van-icon :name="isFav ? 'like' : 'like-o'" :color="isFav ? 'text-#ff5800' : undefined"
                    :class="{ 'text-#ff5800 animate': isFav }" />
            </button>
        </div>
        <span class="game__tag">{{ platformName }}</span>
    </figure>
</template>

<style lang="scss">
.game {
    overflow: hidden;
    border-radius: 8px;
    padding-bottom: 8px;
    background-color: #fff;
    transition: transform 300ms, box-shadow 300ms;
    @apply inline-grid relative;
    box-shadow: inset #aaa 0 0 1px 0;

    &:active {
        transform: scale3d(0.95, 0.95, 1);
    }

    &__thumb {
        @apply block w-full aspect-ratio-square object-cover;
    }

    &-bio {
        // @apply block w-full aspect-ratio-square object-cover;
        // box-shadow: red 0 0 1px 0;
    }

    &__name {
        @apply text-0.85em truncate px-0.28em font-medium;
    }

    &__stat {
        @apply flex justify-between items-center px-0.28em min-w-0 h-56;
    }

    &__likes {
        @apply text-0.71em text-#8286a3;
    }

    &__fav {
        @apply text-0.85em p-0.57em m--0.56em;

        .animate {
            animation: fav-animation 2s cubic-bezier(0.68, -0.55, 0.27, 1.55);
        }
    }

    &__tag {
        @apply absolute z-1 right-0 top-0 text-0.71em bg-#00000080 text-white font-semibold px-0.85em rd-bl-0.28em;
    }
}

@keyframes fav-animation {
    to {
        transform: scale3d(1.8, 1.8, 1);
    }
}
</style>
