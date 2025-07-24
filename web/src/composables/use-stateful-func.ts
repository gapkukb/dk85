export default function useStatefulFunc<T extends Function>(todo: T): [T, Ref<boolean>] {
    const doing = ref(false)
    async function todoWrapper(...args: any) {
        if (doing.value) return
        doing.value = true
        Promise.resolve(todo(...args)).finally(() => {
            doing.value = false
        })
    }
    return [todoWrapper as unknown as T, doing]
}
