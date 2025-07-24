<script setup lang="ts">
import query from './query-game-url';
const route = useRoute()
const url = ref('')
Promise.all([query(route.query), Promise.delay(3000)]).then(([_, gameUrl]) => {
    alert(3)
    url.value = gameUrl
})
</script>

<template>
    <iframe v-if="url" src="" frameborder="0"></iframe>
    <div v-else>游戏启动营销图</div>
</template>

<style lang="scss" scoped></style>