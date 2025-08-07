import { createLocal, createSession } from './_core'
import type { Provider, keys } from './_core'

interface StorageComposable {
    <T = unknown>(key: string): Ref<T | void>
    <T = unknown>(key: string, defaultValue: T): Ref<T>
    keys: typeof keys
}

function createComposable(provider: Provider): StorageComposable {
    function use<T = unknown>(key: string, defaultValue?: T) {
        let value = provider.get(key, defaultValue)
        return customRef(function (track, trigger) {
            return {
                get() {
                    track()
                    return value
                },
                set(newValue) {
                    value = newValue
                    provider.set(key, newValue)
                    trigger()
                },
            }
        })
    }
    use.keys = provider.keys
    return use
}

/**
 * @name local storage
 * @description 持久缓存
 * */
export const ls = createLocal()
/**
 * @name session storage
 * @description 会话缓存
 * */
export const ss = createSession()
/**
 * @name scoped lcoal storage
 * @description 角色持久缓存
 * */
export const lss = createLocal()
/**
 * @name scoped session storage
 * @description 角色会话缓存
 * */
export const sss = createSession()
/**
 * @name reactive local storage
 * @description 响应式的持久缓存
 * */
export const useLs = createComposable(ls)
/**
 * @name reactive session storage
 * @description 响应式的会话缓存
 * */
export const useSs = createComposable(ss)
/**
 * @name reactive scoped local storage
 * @description 响应式的角色持久缓存
 * */
export const useLss = createComposable(lss)
/**
 * @name reactive scoped session storage
 * @description 响应式的角色会话缓存
 * */
export const useSss = createComposable(sss)

export function updatePrefix(prefix: string) {
    lss.setPrefix(prefix)
    sss.setPrefix(prefix)
}
