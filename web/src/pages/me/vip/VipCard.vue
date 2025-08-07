<script setup lang="ts">
import VipCardBar from './VipCardBar.vue';


</script>

<template>
    <div class="vip-card grid content-between">
        <div class="vip-card-topbar flex items-center">
            <h6 class="vip-card-now">当前等级</h6>
            <div class="fs-24 c-#68392D">ID： 4953514</div>
        </div>
        <div class="vip-card-level">9</div>
        <div class="vip-card-bar flex gap-32 px-16 text-24">
            <VipCardBar percentage="75" type="bet" />
            <VipCardBar percentage="75" type="charge" />
        </div>
    </div>
</template>

<style lang="scss">
.vip-card {
    height: 320px;
    background: url(./assets/card2.png) no-repeat 0/contain;
    padding: 8px;
    position: relative;
    color: #B8654A;
    padding-bottom: 28px;

}

.vip-card-now {
    @apply fs-24 font-medium w-180 lh-36 text-center pr-8;

}

.vip-card-level {
    @apply fs-144 block w-fit absolute;
    background: linear-gradient(180deg, #E59F7B -9.68%, #B76349 58.12%, #5F342A 79.53%);
    transform: matrix(1, 0, -0.32, 0.98, 0, 0);
    color: transparent;
    background-clip: text;
    font-weight: 600;
    left: 160px;
    top: 20px;
}

.vip-card-text {
    color: #5F342A;
    mix-blend-mode: multiply;
    font-size: 20px;
}
</style>