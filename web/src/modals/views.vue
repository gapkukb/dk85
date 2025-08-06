<script setup lang="ts">
import { useUser } from '@/stores/user.store'
import { useApp } from '@/stores/app.store'
import Wrapper from './_wrapper.vue'
import { modals } from '.'
import { useLs } from '@/composables'
import { ls } from '@/utils/storage'
import { watchImmediate } from '@vueuse/core';

const InitialDepositBonus = defineAsyncComponent(() => import('@/views/initial-topup-bonus/index.vue'))
// const NewbieGuide = defineAsyncComponent(() => import('@/views/newbie-guide/index.vue'))
const PlayTrial = defineAsyncComponent(() => import('@/views/play-trial/index.vue'))
const CompleteProfile = defineAsyncComponent(() => import('@/views/complete-profile/index.vue'))
const Authentication = defineAsyncComponent(() => import('@/pages/authentication/index.vue'))

const user = useUser()
const app = useApp()
const route = useRoute()
const completeProfile = useLs(ls.keys.completeProfile, true)

/** 展示完善信息弹窗 */
const showComplete = computed(() => {
    if (!user.info) return false;
    if (user.info.mobile) return false;
    return completeProfile.value
})

watchImmediate(showComplete, modals.completeProfile.toggle)


function completeProfileClosed() {
    completeProfile.value = false;
}

</script>

<template>
    <Wrapper v-model="modals.authentication.value" position="right" class="size-full !max-w-none">
        <Authentication />
    </Wrapper>
    <Wrapper v-model="modals.initialTopupBonus.value">
        <InitialDepositBonus />
    </Wrapper>
    <!-- <Wrapper v-model="modals.newbieGuide.value">
        <NewbieGuide />
    </Wrapper> -->
    <Wrapper v-model="modals.playTrial.value">
        <PlayTrial />
    </Wrapper>
    <Wrapper v-model="modals.completeProfile.value" class="!w-700" round :close-on-click-overlay="false"
        @closed="completeProfileClosed">
        <CompleteProfile />
    </Wrapper>
</template>
