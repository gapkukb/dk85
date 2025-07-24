<script setup lang="ts">
const details = [
    {
        id: 1,
        name: t("account.password"),
        settled: false,
        to: "/me/update-password"
    },
    {
        id: 2,
        name: t("account.phone"),
        settled: false,
        value: "",
        get to() {
            if (this.settled) return '/me/update-phone'
            return '/me/bind-phone'
        }
    },
    {
        id: 3,
        name: t("account.email"),
        settled: false,
        value: "",
        get to() {
            if (this.settled) return '/me/update-email'
            return '/me/bind-email'
        }
    },
    {
        id: 4,
        name: t("account.realName"),
        settled: true,
        value: "Axiba",
        get to() {
            // if (this.settled) return
            return '/me/real-name'
        }
    },
]
</script>

<template>
    <!-- <nav-bar :title="$t('page.account')" /> -->
    <van-cell-group>
        <van-cell v-for="detail in details" :is-link="detail.id == 4 ? !detail.settled : true" :title="detail.name"
            :to="detail.to" :clickable="false">
            <van-tag v-if="detail.settled" type="success">{{ detail.value }}</van-tag>
            <van-tag v-else type="warning">{{ $t("me.unsettled") }}</van-tag>
        </van-cell>
    </van-cell-group>
</template>

<style lang="scss" scoped></style>