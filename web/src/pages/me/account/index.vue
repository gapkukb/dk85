<script setup lang="ts">
import { useUser } from '@/stores/user.store'

const user = useUser()
const details = computed(() => [
    {
        id: 1,
        name: t('account.password'),
        settled: true,
        to: '/me/update-password',
    },
    {
        id: 2,
        name: t('account.phone'),
        settled: !!user.info?.mobile,
        value: '',
        get to() {
            if (this.settled) return '/me/update-phone'
            return '/me/bind-phone'
        },
    },
    {
        id: 3,
        name: t('account.email'),
        settled: !!user.info?.email,
        value: '',
        get to() {
            if (this.settled) return '/me/update-email'
            return '/me/bind-email'
        },
    },
    {
        id: 4,
        name: t('account.realName'),
        settled: true,
        value: 'Axiba',
        get to() {
            // if (this.settled) return
            return '/me/real-name'
        },
    },
])
</script>

<template>
    <nav-bar :title="$t('page.account')" />
    <van-cell-group>
        <van-cell v-for="detail in details" :is-link="detail.id == 4 ? !detail.settled : true" :title="detail.name"
            :to="detail.to" :clickable="false">
            <van-tag v-if="detail.settled" type="success">
                {{ detail.value }}
            </van-tag>
            <van-tag v-else type="warning">
                {{ $t('me.unsettled') }}
            </van-tag>
        </van-cell>
    </van-cell-group>
</template>

<style lang="scss">
.page-account {
    // padding: 0;
}
</style>
