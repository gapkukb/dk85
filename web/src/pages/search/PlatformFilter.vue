<script setup lang="ts">
import type mock from './mock.json'

const model = defineModel<string[]>()
// const props = defineProps<{ platforms: string[] }>()
const platforms = [
    {
        name: '全部',
        value: '',
    },
    {
        name: 'ONE',
        value: 'one',
    }
]
const show = ref(false)
const _selected = ref<string[]>([])
const selected = computed({
    get() {
        return _selected.value
    },
    set(value: string[]) {
        if (value.length < 2) return
        if (value.at(-1)) {
            _selected.value = value!.slice(-1)
        } else {
            _selected.value = value!.filter((i) => !!i)
        }
    },
})

function start() {
    _selected.value = Array.from(model.value || [])
    show.value = true
}

function finish() {
    model.value = Array.from(selected.value)
    show.value = false
}

</script>

<template>
    <button @click="start" class="size-64 fs-36 block">
        <i class="iconfont iconfont-guolvqi"></i>
    </button>
    <van-popup v-model:show="show" position="bottom" teleport="body" style="background: none;max-height: 50vh;"
        :before-close="finish">
        <!-- <div class="h-120"></div> -->
        <van-checkbox-group v-model="selected" shape="round" checked-color="#ff5800">
            <van-cell v-for="platform in platforms" :key="platform.value">
                <van-checkbox class="justify-between" :name="platform.value" label-position="left">
                    {{ platform.name }}
                </van-checkbox>
            </van-cell>
        </van-checkbox-group>
        <van-button class="!sticky bottom-0" type="danger" square block @click="finish">
            过滤
        </van-button>
    </van-popup>
</template>

<style lang="scss">
.search-fliter {
    .van-action-sheet__item {
        border-bottom: 1px solid #ddd;
    }

    .van-icon {
        position: absolute;
        right: 8px;
    }

    .van-action-sheet__cancel {
        background-color: #ff5800;
        color: white;
    }
}
</style>
