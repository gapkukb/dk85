<script setup lang="ts"></script>

<template>
    <div class="flex items-center flex-gap-24">
        <button
            @click="$router.push('/search')"
            class="size-64 c-primary fs-36 bg-white rd-full"
        >
            <i class="iconfont iconfont-sousuo"></i>
        </button>
        <CallCenter class="size-64 c-#6b7984 fs-36 bg-white rd-full" />
    </div>
</template>
