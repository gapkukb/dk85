<script setup lang="ts">
const props = defineProps<{ isEmail: boolean, target: string }>()
const title = props.isEmail ? t('form.send_email') : t('form.send_phone')
</script>

<template>
    <h6 class="target-client">
        <i class="iconfont grid-row-span-2 fs-36 op-50"
            :class="isEmail ? 'iconfont-youxiangyanzhengma' : 'iconfont-yanzhengma'"></i>
        <div class="">{{ title }}</div>
        <div class="text-primary">{{ target }}</div>
    </h6>

</template>

<style lang="scss">
.target-client {
    @apply grid;
    grid-template-columns: auto 1fr;
    column-gap: 8px;

}
</style>