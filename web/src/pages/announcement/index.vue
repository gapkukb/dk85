<script setup lang="ts">
import { queryNotices } from '@/api'

const show = ref(false)
const notices = shallowRef<model.app.Notice[]>([])
const activeNames = ref([])
queryNotices().then((data = []) => {
    if (data.length !== 0) {
        show.value = true;
    }
    notices.value = data
})
</script>

<template>
    <ModalPage v-model:show="show" class="announcement" :title="$t('page.announcement')">
        <van-collapse v-model="activeNames" class="w-652 h-796 bg-white rd-24 overflow-auto">
            <van-collapse-item v-for="(notice, index) in notices" :key="notice.created_at" :name="notice.created_at"
                :title="notice.title" center title-class="fs-32 font-medium c-#111 truncate" icon-prefix="iconfont"
                icon="iconfont-arrow-down-filled">
                {{ notice.content }}
            </van-collapse-item>
        </van-collapse>
    </ModalPage>
</template>

<style lang="scss">
.announcement {
    .van-collapse-item__title {
        height: 108px;
    }

    .van-collapse-item__content {
        color: #666;
    }

    .van-cell__right-icon {
        font-family: 'iconfont';

        &:before {
            content: '\effc';
            color: #ff5800;
        }
    }
}
</style>
