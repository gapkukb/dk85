<script setup lang="ts">
import { Modals, ModalsName } from '@/modals'
</script>

<template>
    <div class="flex items-center flex-gap-0">
        <customer-service class="size-32 text-20 lh-1"/>
        <button @click="$router.push('/trends')" class="size-32 text-18 lh-1 mr-4"><i-ri:search-line /></button>
        <!-- <van-button class="" size="mini" round  @click="Modals.open(ModalsName.cs)"><i-icon-park:customer /></van-button> -->
        <!-- <van-button class="" size="mini" round  icon="search" to="/search"></van-button> -->
        <van-button class="min-w-64" size="mini" round type="danger" to="/wallet/deposit">{{ $t('app.deposit') }}</van-button>
        <van-button class="min-w-64" size="mini" round type="warning" to="/wallet/withdrawal">{{ $t('app.withdrawal') }}</van-button>
    </div>
</template>
