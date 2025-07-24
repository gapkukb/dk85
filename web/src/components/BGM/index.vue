<script setup lang="ts">
import { useApp } from '@/stores/app.store'
import { useEventListener } from '@vueuse/core'
const app = useApp()
const el = useTemplateRef<HTMLAudioElement>('bgm')

useEventListener(document, 'click', function () {
    el.value?.play()
})
</script>

<template>
    <audio
        v-if="app.unmuted"
        ref="bgm"
        autoplay
        loop
        :controls="false"
    >
        <source
            src="@/assets/media/game_bg.mp3"
            type="audio/mpeg"
        />
    </audio>
</template>

<style lang="scss" scoped></style>
