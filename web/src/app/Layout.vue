<script setup lang="ts">
const route = useRoute()
const title = computed(() => route.matched.at(-1)?.meta.title)
console.log(route.matched);

</script>

<template>
    <nav-bar v-if="title" fixed :title="$t(title)" z-index="10" />
    <router-view />
</template>