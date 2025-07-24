<script setup lang="ts">
import useLoadMore from '@/composables/useLoadMore'

useLoadMore(() => {})
</script>

<template>
    <div class="home-view">
        <GameTable
            paginable
            title="ALL GAMES"
        />
    </div>
</template>

<style lang="scss"></style>
