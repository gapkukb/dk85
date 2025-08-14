<script setup lang="ts">
import { useLocale } from '@/locales'
import { useApp } from '@/stores/app.store'
import { useUser } from '@/stores/user.store'
import { showConfirmDialog, showSuccessToast, showToast } from 'vant'

const { clearUser } = useUser()
const app = useApp()
const version = import.meta.env.PACKAGE_VERSION

async function doLogout() {
    await showConfirmDialog({
        title: t('me.logout_tip'),
        confirmButtonColor: '#ff5800',
        confirmButtonText: t('app.continue'),
    })

    clearUser()

    showSuccessToast({
        message: t('me.logout_done'),
        forbidClick: true,
        onClose() {
            window.location.href = '/'
        },
    })
}
</script>

<template>
    <nav-bar :title="$t('me.more')" />
    <van-cell-group>
        <language-picker>
            <template #default="{ localeName, show }">
                <van-cell :title="$t('app.lang')" is-link @click="show">
                    {{ localeName }}
                </van-cell>
            </template>
        </language-picker>

        <van-cell :title="$t('app.version')">V {{ version }}</van-cell>

        <van-cell :title="$t('app.bgm')">
            <van-switch v-model="app.unmuted" size="18" />
        </van-cell>
        <van-cell>
            <van-button type="danger" block @click="doLogout">
                <span class="uppercase text-32 font-medium">{{ $t('me.logout') }}</span>
            </van-button>
        </van-cell>
    </van-cell-group>

</template>

<style lang="scss">
.page-more {
    // padding: 0;
}
</style>
