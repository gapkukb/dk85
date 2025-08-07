<script setup lang="ts">
import type { SwipeInstance } from 'vant'
import VipCard from './VipCard.vue'
import VipRight from './VipRight.vue'
import levels from './levels.config'
const swipeRef = ref<SwipeInstance>()
const prev = () => swipeRef.value?.prev()
const next = () => swipeRef.value?.next()
</script>

<template>
    <NavBar :title="$t('page.vip')">
        <template #right>
            <router-link
                to="/vip/details"
                class="inline-flex items-center gap-8"
            >
                <!-- <i-lsicon:vip-outline class="fs-18" /> -->
                <!-- <span>{{ $t('app.details') }}</span> -->
                <i class="iconfont iconfont-jiantou rotate-90 !fs-36"></i>
            </router-link>
        </template>
    </NavBar>
    <VipCard />

    <van-swipe
        ref="swipeRef"
        class="grid"
        :loop="false"
    >
        <template #indicator="{ active, total }">
            <div class="h-96 order-first">
                <div class="flex items-center pt-32 pb-16 absolute w-full">
                    <div class="flex-1">
                        <button
                            :disabled="active === 0"
                            class="vip-rights-button"
                            @click="prev"
                        >
                            <van-icon name="arrow-left" />
                            <span>Previous level</span>
                        </button>
                    </div>
                    <h5 class="vip-rights">VIP{{ active + 1 }} {{ $t('me.vip.rights') }}</h5>
                    <div class="flex-1 text-right">
                        <button
                            :disabled="active === total - 1"
                            class="vip-rights-button"
                            @click="next"
                        >
                            <span>Next level</span>
                            <van-icon name="arrow" />
                        </button>
                    </div>
                </div>
            </div>
        </template>
        <van-swipe-item
            v-for="level in levels"
            :key="level.level"
        >
            <div class="grid grid-cols-2 gap-16">
                <VipRight
                    type="advance"
                    :amount="level.advance"
                />
                <VipRight
                    type="weekly"
                    :amount="level.weekly"
                />
                <VipRight
                    type="monthly"
                    :amount="level.monthly"
                />
                <VipRight
                    type="annual"
                    :amount="level.annual"
                />
            </div>
        </van-swipe-item>
    </van-swipe>
</template>

<style lang="scss">
.vip-rights {
    @apply flex-1 text-center font-semibold;
    background: linear-gradient(to right, #853e00, #e09357);
    background-clip: text;
    color: transparent;
}

.vip-rights-button {
    @apply h-48 px-16 rd-full text-24 c-#fff bg-#ff5800 disabled:op-60;
}
</style>
