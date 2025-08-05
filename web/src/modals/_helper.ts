import { maxBy } from 'lodash-es'

type Configuration = { name: string; priority: number; show: Ref<boolean> }
let now: Configuration | undefined = undefined
let refs: Configuration[] = []

// 弹窗队列
export default function useModal(
    name: string,
    priority = 0,
    options?: {
        parallel?: boolean
        initial?: boolean
    }
) {
    const { initial = false, parallel = false } = options || {}

    const show = ref(initial)

    return computed<boolean>({
        get() {
            return show.value
        },
        set(display) {
            if (display === show.value) return
            
            if (parallel) {
                show.value = display
                return
            }

            if (display) {
                // debugger
                const current = { priority, show: show, name }
                // 没有正在显示的弹窗，直接显示
                if (!now) {
                    now = current
                    show.value = true
                } else if (priority >= now.priority) {
                    // 如果是高优先级，将正在显示的关闭并压入队列等待显示
                    now.show.value = false
                    refs.push(now)
                    now = current
                    now.show.value = true
                } else {
                    //否则为低优先级低，压入队列，等待显示
                    refs.push(current)
                }
            } else {
                if (!now) return

                // 如果是关闭正在显示的弹窗
                if (now.name === name) {
                    // 关闭正在显示的弹窗
                    now.show.value = false
                    // 检查队列，找出优先级最高的进行显示,并保持引用
                    now = maxBy(refs, 'priority')
                    if (now) {
                        refs = refs.filter((i) => i !== now)
                        now.show.value = true
                    }
                } else {
                    // 否则视为关闭队列中的弹窗，需要找出并关闭并删除
                    const matched = refs.find((i) => i.name === name)
                    if (matched) {
                        matched.show.value = false
                        refs = refs.filter((i) => i !== matched)
                    }
                }
            }
        },
    })
}
