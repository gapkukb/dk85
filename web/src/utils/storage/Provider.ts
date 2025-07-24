import keys, { type StorageKeys } from './keys'

type Prefix = boolean | 0 | 1

export default class Provider<K extends StorageKeys = StorageKeys> {
    static regexp = /\B(?=[A-Z])/g

    static {
        this.prototype.keys = keys
    }
    declare keys: typeof keys
    #prefix = ''

    constructor(public storage: Storage) {}

    protected getKey(key: string, prefix: Prefix) {
        key = key.replace(Provider.regexp, '_').toUpperCase()
        if (prefix) return this.#prefix + key
        return key
    }

    setPrefix(prefix: string = ''): this {
        this.#prefix = prefix + '_'
        return this
    }

    clear(): this {
        this.storage.clear()
        return this
    }
    /**
     *
     * @param key 键名
     * @param defaultValue 默认值
     * @param prefix 是否携带前缀 true,false,0,1
     * @returns value
     */
    get<T = unknown>(key: K | string): T
    get<T = unknown>(key: K | string, defaultValue: T | (() => T)): T
    get<T = unknown>(key: K | string, defaultValue?: T, prefix: Prefix = true): T | null {
        key = this.getKey(key, prefix)
        const value = this.storage.getItem(key)

        return value === null || value === undefined ? defaultValue || null : JSON.parse(value!)
    }

    /**
     *
     * @param key 键名
     * @param value 默认值
     * @param prefix 是否携带前缀 true,false,0,1
     * @returns this
     */
    set(key: K | string, value: any, prefix: Prefix = true): this {
        if (value === null || value === void 0) return this
        key = this.getKey(key, prefix)
        this.storage.setItem(key, JSON.stringify(value))
        return this
    }

    /**
     *
     * @param key 键名
     * @param prefix 是否携带前缀 true,false,0,1
     * @returns this
     */
    remove(key: K | string, prefix: Prefix = true): this {
        key = this.getKey(key, prefix)
        this.storage.removeItem(key)
        return this
    }
}
