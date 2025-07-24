<script setup lang="ts">
import { useBack } from '@/composables/useBack';

defineProps<{ job: any }>()
const todo = useBack()
const accountNo = ref('')
const title = useRoute().query.id ? '修改银行卡' : '新增银行卡'
const name = ref('')


function submit() { }
</script>

<template>
    <van-nav-bar left-arrow fixed :title="title" @click-left="todo">
        <!-- <template #right>
            <button class="text-28 text-primary"><svg t="1752914217730" class="icon" viewBox="0 0 1024 1024"
                    version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="34806" width="1em" height="1em"
                    fill="currentColor">
                    <path
                        d="M948 745.5c0.2-0.6 0.4-1.3 0.6-1.9-0.3 0.6-0.5 1.2-0.6 1.9zM468.2 732.3c-0.1-0.4-0.2-0.9-0.3-1.3 0.1 0.4 0.2 0.8 0.3 1.3zM63.1 322.7v309c0 41.4 33.6 75 75 75h325.1c-1.6-11.4-2.5-23.1-2.5-35 0-137.6 111.6-249.2 249.2-249.2 89.1 0 167.3 46.8 211.3 117.1V322.7H63.1z m180.2 112.8H192v-51.3h51.3v51.3z m96.1 0h-51.3v-51.3h51.3v51.3z m96 0h-51.3v-51.3h51.3v51.3z">
                    </path>
                    <path
                        d="M709.9 473.5c-109.7 0-198.9 89.2-198.9 198.9s89.2 198.9 198.9 198.9 198.9-89.2 198.9-198.9-89.2-198.9-198.9-198.9z m103 238.2h-78v78c0 13.8-11.2 25-25 25s-25-11.2-25-25v-78h-78c-13.8 0-25-11.2-25-25s11.2-25 25-25h78v-78c0-13.8 11.2-25 25-25s25 11.2 25 25v78h78c13.8 0 25 11.2 25 25s-11.2 25-25 25zM921.2 272.7V180c0-41.4-33.6-75-75-75H138.1c-41.4 0-75 33.6-75 75v92.7h858.1z">
                    </path>
                </svg>
            </button>
        </template> -->
    </van-nav-bar>

    <van-form class="p-12 grid gap-8" @submit="submit">

        <van-field v-model="name" :border="false" :placeholder="$t('form.placeholder.account')"></van-field>
        <van-field v-model="name" :border="false" :placeholder="$t('form.placeholder.account')"></van-field>
        <van-field v-model="name" :border="false" :placeholder="$t('form.placeholder.account')"></van-field>
        <van-field v-model="name" :border="false" :placeholder="$t('form.placeholder.account')"></van-field>
        <van-field v-model="name" :border="false" :placeholder="$t('form.placeholder.account')"></van-field>

        <div class="h-8"></div>

        <van-button type="danger" block>{{ $t("app.confirm") }}</van-button>
    </van-form>
</template>

<style lang="scss">
.page-edit {}
</style>