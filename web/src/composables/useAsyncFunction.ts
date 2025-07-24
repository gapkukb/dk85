export default function useAsyncFunction<T extends Function>(todo: T): { todo: T; doing: Ref<boolean>; successful: Ref<boolean> } {
    const doing = ref(false)
    const successful = ref(false)
    async function excute(...args: any) {
        if (doing.value) return
        doing.value = true
        Promise.try(() => todo(...args))
            .then(() => {
                successful.value = true
            })
            .finally(() => {
                doing.value = false
            })
    }
    return {
        todo: excute as unknown as T,
        doing,
        successful,
    }
}
