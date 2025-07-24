<script setup lang="ts">
import { useLocale } from '@/locales'
import { Modals, ModalsName } from '@/modals'
import { useApp } from '@/stores/app.store'
import { useUser } from '@/stores/user.store'
import { showConfirmDialog, showToast } from 'vant'

const { localeName } = useLocale()
const { logout } = useUser()
const app = useApp()
const version = import.meta.env.PACKAGE_VERSION

async function doLogout() {
    await showConfirmDialog({
        title: t("me.logout_tip"),
        confirmButtonColor: '#ff5800',
        confirmButtonText: t("app.continue")
    })

    await logout()

    showToast({
        message: t("me.logout_done"),
        closeOnClick: false,
        closeOnClickOverlay: false,
        duration: 3000, onClose() {
            window.location.href = '/'
        },
    })
}
</script>

<template>
    <nav-bar :title="$t('me.more')" />
    <van-cell-group>
        <van-cell :title="$t('app.lang')" is-link @click="Modals.open(ModalsName.locale)">
            {{ localeName }}
        </van-cell>

        <van-cell :title="$t('app.version')">V {{ version }}</van-cell>

        <van-cell :title="$t('app.bgm')">
            <van-switch v-model="app.unmuted" size="18" />
        </van-cell>
    </van-cell-group>

    <div class="bg-white px-16 pt-32 pb-16">
        <van-button type="danger" block @click="doLogout">
            <span class="uppercase text-16 font-medium">{{ $t('me.logout') }}</span>
        </van-button>
    </div>
</template>

<style lang="scss"></style>
