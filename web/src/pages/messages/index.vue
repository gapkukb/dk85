<script setup lang="ts">
import Message from './Message.vue';
import Notification from './Notification.vue';

const tab = ref(0)

</script>

<template>
    <nav-bar :title="$t('page.messages')" class="messages">
        <template #right>
            <van-badge dot>
                <button class="van-haptics-feedback text-20" :class="{ 'text-#aaa': tab === 1 }" @click="tab = 0">
                    <van-icon name="volume-o" />
                </button>
            </van-badge>
            <div class="w-16"></div>
            <van-badge dot @click.stop="">
                <!-- Notification -->
                <button class=" van-haptics-feedback text-20" :class="{ 'text-#aaa': tab === 0 }" @click="tab = 1">
                    <van-icon name="envelop-o" />
                </button>
            </van-badge>
        </template>
    </nav-bar>

    <Message v-if="tab === 0" />

    <Notification v-else />

</template>

<style lang="scss">
.page-messages {
    background-color: #f1f1f1;
    // background-color: #111;
}

.messages .van-nav-bar__right.van-haptics-feedback:active {
    opacity: 1;
}
</style>