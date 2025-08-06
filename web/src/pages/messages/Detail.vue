<script setup lang="ts">
import { pagesName } from '@/router';

defineOptions({ name: pagesName.messageDetail })
</script>

<template>
    <nav-bar :title="$t('page.message')" />
    <div class="bg-white p-24 grid gap-24">
        <h1 class="fs-32 lh-none font-bold">消息标题</h1>
        <p class="fs-22 lh-none c-#999">2025-02-02 00:00:00</p>
        <div class="">RSG ဂိမ်းများသည် 8လ 6 ရက်နေ့ နံနက်ခင်း  9:30 နာရီမှ 1:30 နာရီအထိ ပြုပြင်ထိန်းသိမ်းမှုပြုလုပ်နေမည်ဖြစ်ပြီး အဆိုပါအချိန်အတွင်း ဂိမ်းများကို သင်ဝင်ရောက်ကြည့်ရှုနိုင်တော့မည်မဟုတ်ပါ။ သင့်တွင်မေးခွန်းများရှိပါက ကျွန်ုပ်တို့၏ 24 နာရီဖောက်သည်ဝန်ဆောင်မှုကို ဆက်သွယ်ပါ။</div>
    </div>
</template>

<style lang="scss">
.page-message{
    @apply p-24;
}
</style>