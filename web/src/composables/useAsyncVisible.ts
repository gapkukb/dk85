export function useAsyncVisible() {
    const visible = ref(false)
    nextTick(() => {
        visible.value = true
    })
    return visible
}
