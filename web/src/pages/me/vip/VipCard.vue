<script setup lang="ts">
import VipCardBar from './VipCardBar.vue';


</script>

<template>
    <div class="vip-card grid content-between">
        <div class="vip-card-topbar flex items-center">
            <h6 class="vip-card-now">当前等级</h6>
            <div class="fs-12 c-#68392D">ID： 4953514</div>
        </div>
        <div class="vip-card-level">9</div>
        <div class="vip-card-bar flex gap-16 px-8 text-12">
            <VipCardBar percentage="75" type="bet" />
            <VipCardBar percentage="75" type="charge" />
        </div>
    </div>
</template>

<style lang="scss">
.vip-card {
    height: 160px;
    background: url(./assets/card2.png) no-repeat 0/contain;
    padding: 4px;
    position: relative;
    color: #B8654A;
    padding-bottom: 14px;

}

.vip-card-now {
    @apply fs-12 font-medium w-90 lh-18 text-center pr-4;

}

.vip-card-level {
    @apply fs-72 block w-fit absolute;
    background: linear-gradient(180deg, #E59F7B -9.68%, #B76349 58.12%, #5F342A 79.53%);
    transform: matrix(1, 0, -0.32, 0.98, 0, 0);
    color: transparent;
    background-clip: text;
    font-weight: 600;
    left: 80px;
    top: 10px;
}

.vip-card-text {
    color: #5F342A;
    mix-blend-mode: multiply;
    font-size: 10px;
}
</style>