<script setup lang="ts">
import useAsyncFunction from '@/composables/useAsyncFunction'
import { router } from '@/router'

const { todo, doing } = useAsyncFunction((values: any) => {
    console.log(values)
    return Promise.delay(1000).then(() => {
        router.replace('/success/bound')
    })
})
</script>

<template>
    <nav-bar :title="$t('page.bindEmail')"></nav-bar>

    <van-form
        class="bg-white grid gap-48 p-24 mt-24"
        @submit="todo"
    >
        <email-input autofocus />
        <van-button
            :disabled="doing"
            type="danger"
            block
            native-type="submit"
        >
            {{ $t('app.bind') }}
        </van-button>
    </van-form>
</template>

<style lang="scss">
.page-bindemail {
    padding: 0;
}
</style>
