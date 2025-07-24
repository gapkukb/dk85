<script setup lang="ts">
const descriptions = Object.freeze([
    'I am over 21 years of age.',
    'I am not a government official, or employee connected directly with the operation of the Government or any of its agencies, member of the Armed Forces of the Philippines, including the Army, Navy, Air Force, or the Philippine National Police.',
    "I am not in the PAGCOR's National Database of Restricted Persons(NDRP)",
    'I am not a Gaming Employment License (GEL) holder.',
    "I have read and agree to ArenaPlus's",
    'Terms of use and Privacy Policy',
])

const funds = 'Funds or credits in the account of player who is found ineligible to play shall mean forfeiture of said funds/credits in favor of the Government.'
const keep = 'Keep online gaming private. Refrain from playing online games in open and public places.'
const model = defineModel<boolean>()

defineProps<{aaaaaa:string}>()
</script>

<template>
    <van-popup v-once v-model:show="model" round destroy-on-close :close-on-click-overlay="false" position="bottom" class="guidelines">
        <img src="@/assets/images/logo1.png" class="size-50 mx-auto mb-16" />
        <h2 class="text-#111 font-600 mt-8">Please read our guidelines carefully:</h2>
        <ul class="list-disc marker:text-#ff5800 marker:text-16 marker:mr-1 text-12 font-400 text-#111 pl-20">
            <li v-for="text in descriptions" :key="text" class="ml-0 pl-0">{{ text }}</li>
        </ul>
        <div class="text-12 font-semibold mt-8">{{ funds }}</div>
        <div class="flex flex-gap-16 mt-20">
            <van-button class="w-140" plain round color="#ff5800">Exit</van-button>
            <van-button class="flex-1" round color="#ff5800">Proceed</van-button>
        </div>
        <img src="@/assets/images/pagcor.png" class="h-38 mx-auto mt-16" />
        <footer class="mt-14 text-12 text-#999 lh-16 text-center">{{ keep }}</footer>
    </van-popup>
</template>

<style lang="scss">
.guidelines {
    @apply p-20;
    background: #fff url(bg.png) no-repeat top center/110% auto;

    &__list {
        &::marker {
            content: '•';
        }
    }
}
</style>
