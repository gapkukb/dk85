<script setup lang="ts">
import Access from './Access.vue'
import Recover from './Recover.vue'

const recover = ref(false)
</script>

<template>
    <ModalPage position="right" :closeable="false">
        <Recover v-if="recover" :key="recover.toString()" @back="recover = false" />
        <Access v-else @forgot="recover = true" />
    </ModalPage>
</template>

<style lang="scss">
.page-account {
    background: url('@/assets/images/account-bg.webp') no-repeat 0 0/100% auto;
}

.page-account-button {
    @apply inline-flex gap-4 items-center h-32 justify-center text-12 bg-#ffebe7 text-primary rd-full px-8;
}
</style>
