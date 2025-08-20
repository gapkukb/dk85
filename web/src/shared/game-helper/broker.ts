import { useApp } from '@/stores/app.store'
import defined from './defined'
import querGames from './query'
import Worker from './worker?worker&inline'

const worker = new Worker({ name: 'gameWorker' })

function dispatch<T extends unknown>({
    onsuccess,
    defaultValue,
    ...message
}: {
    onsuccess?: (data: T) => T
    type: string
    value?: any
    defaultValue?: T
    [key: string]: any
}) {
    const channel = new MessageChannel()
    const promise = Promise.withResolvers<any>()
    function callback(e: MessageEvent) {
        const v = onsuccess ? onsuccess(e.data) : e.data
        promise.resolve(v)
        console.log({v});
        
        channel.port1.onmessage = channel.port1.onmessageerror = null
    }
    channel.port1.onmessage = channel.port1.onmessageerror = callback
    worker.postMessage(message, [channel.port2])

    return promise.promise
}

export default abstract class A {
    declare static v: string
    static #promise: PromiseWithResolvers<any> | null = null

    static async #ensureInitialized() {
        if (this.#promise) {
            return this.#promise.promise
        }
        this.#promise = Promise.withResolvers()
        const app = useApp().appInfo
        const bianry = await querGames(app.version)
        await dispatch({
            type: defined.set,
            value: bianry,
        })
        this.#promise.resolve(true)
    }

    static async getAll() {
        await this.#ensureInitialized()
        return dispatch({
            type: defined.getAll,
        })
    }

    static async query<T>(keywords?: string, kind?: string, platform?: string[]): Promise<T> {
        await this.#ensureInitialized()
        return dispatch<T>({
            type: defined.query,
            kind,
            platform,
            keywords,
        }).then((data = []) =>data)
    }
}
