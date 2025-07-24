import { ls, ss, type StorageKeys } from '@/utils/storage'
import type Provider from '@/utils/storage/Provider'
import { customRef } from 'vue'
export { storageKeys } from '@/utils/storage'

function create(provider: Provider) {
    return function use<T = unknown>(key: StorageKeys, defaultValue: T) {
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
}

export const useLs = create(ls)
export const useSs = create(ss)
