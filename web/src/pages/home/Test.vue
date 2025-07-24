<script setup lang="ts">
function generateRandomHexColor() {
    // Generate a random number between 0 and 16777215 (FFFFFF in hexadecimal)
    // Convert it to a hexadecimal string
    let randomColor = Math.floor(Math.random() * 16777215).toString(16);

    // Pad the string with leading zeros if necessary to ensure 6 characters
    randomColor = randomColor.padStart(6, '0');

    // Prepend '#' to make it a valid hex color code
    return `#${randomColor}`;
}
</script>

<template>
    <div class="content-view">
        <div v-for="i in 30" class="h-50" :style="{ background: generateRandomHexColor() }">

        </div>
    </div>
</template>

<style lang="scss">
.content-view {
    width: 100%;
    position: absolute;
    left: 0;
    top: 0;
    right: 0;
    bottom: 0;
    overflow-y: auto;
    padding-top: var(--h-header);
    padding-bottom: var(--h-footer);
}
</style>