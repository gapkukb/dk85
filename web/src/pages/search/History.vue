<script setup lang="ts">
const model = defineModel<string[]>({ required: true })
const emit = defineEmits<{ search: [keywords: string] }>()

function click(index: number) {
    emit('search', model.value[index])
}
function close(index: number) {
    model.value = model.value.slice(0, index).concat(model.value.slice(index + 1))
}
</script>

<template>
    <div class="bg-#f1f1f1 p-12">
        <div class="flex justify-between items-center">
            <h6 class="text-12 font-semibold">Search History</h6>
            <van-button icon="delete-o" icon-position="right" size="mini" round style="border: 0;">clear</van-button>
        </div>
        <div class="flex gap-8 flex-wrap mt-8">
            <van-tag v-for="(tag, index) in model" :key="tag" :data-index="index" plain type="primary" round closeable
                size="medium" @close="close(index)" @click="click(index)">{{ tag }}</van-tag>
        </div>
    </div>
</template>

<style lang="scss" scoped></style>