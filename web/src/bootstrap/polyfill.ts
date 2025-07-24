Object.defineProperty(Promise, 'delay', {
    value(ms = 0) {
        if (ms === 0) return this.resolve()
        return new Promise((rs) => setTimeout(rs, ms))
    },
})

Object.defineProperty(Array.prototype, 'has', {
    value(this: Array<any>, item: any) {
        if(this.length===0) return false;
        return new Set(this).has(item)
    },
})

declare global {
    interface PromiseConstructor {
        delay(ms?: number): Promise<any>
    }
    interface Array<T> {
        has(item: T): boolean
    }
}
