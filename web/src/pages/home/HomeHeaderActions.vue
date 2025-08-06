<script setup lang="ts">
import { Modals, ModalsName } from '@/modals'
</script>

<template>
    <div class="flex items-center flex-gap-0">
        <customer-service class="size-64 text-40 lh-1"/>
        <button @click="$router.push('/trends')" class="size-64 text-36 lh-1 mr-8"><i-ri:search-line /></button>
        <!-- <van-button class="" size="mini" round  @click="Modals.open(ModalsName.cs)"><i-icon-park:customer /></van-button> -->
        <!-- <van-button class="" size="mini" round  icon="search" to="/search"></van-button> -->
        <van-button class="min-w-127" size="mini" round type="danger" to="/funds/deposit">{{ $t('app.deposit') }}</van-button>
        <van-button class="min-w-128" size="mini" round type="warning" to="/funds/withdrawal">{{ $t('app.withdrawal') }}</van-button>
    </div>
</template>
