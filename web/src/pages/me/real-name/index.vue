<script setup lang="ts">
import useAsyncFunction from '@/composables/useAsyncFunction'
import success from '@/utils/success'
import { showDialog } from 'vant'

const tip = t('me.realnameWarn')
const realname = ref('')
const rules = [{ required: true, message: t('form.error.required', { name: t('me.realname') }) }]

const { doing, todo } = useAsyncFunction(async function update() {
    await showDialog({
        showCancelButton: true,
        confirmButtonText: t('app.next'),
        confirmButtonColor: '#ff5800',
        message: tip,
    })

    await Promise.delay(1000)

    success(success.type.SETTLE)
})
</script>

<template>
    <nav-bar :title="$t('page.realname')" />
    <van-form
        class="grid gap-48 p-24 mt-24 bg-white"
        @submit="todo"
    >
        <van-field
            v-model="realname"
            autofocus
            class="van-field-solid"
            :placeholder="$t('form.placeholder.realname')"
            :rules="rules"
        ></van-field>
        <van-notice-bar
            wrapable
            :scrollable="false"
            left-icon="info-o"
            class="!text-24"
        >
            {{ tip }}
        </van-notice-bar>
        <van-button
            block
            type="danger"
            native-type="submit"
            :loading="doing"
        >
            {{ $t('app.setup') }}
        </van-button>
    </van-form>
</template>

<style lang="scss">
.page-realname {
    padding: 0;
}
</style>
