<script setup lang="ts">
import type { ActionSheetAction } from 'vant';

const show = ref(true)

const actions = ref<ActionSheetAction[]>(Array.from({ length: 20 }).fill(
    {
        icon: 'circle',
        name: 'JILI',
        className: 'relative',
        callback: clickItem,
    },

))
function clickItem(action: ActionSheetAction) {
    action.icon = 'certificate'
    action.color = 'red'
}
</script>

<template>
    <button @click="show = true" class="text-24 block lh-1"><i-stash:filter-light /></button>
    <van-action-sheet v-model:show="show" :actions="actions" cancel-text="确定" class="search-fliter" teleport="body">

    </van-action-sheet>
</template>

<style lang="scss">
.search-fliter {
    .van-action-sheet__item {
        border-bottom: 1px solid #ddd;
    }

    .van-icon {
        position: absolute;
        right: 8px;
    }

    .van-action-sheet__cancel {
        background-color: #ff5800;
        color: white;
    }
}
</style>