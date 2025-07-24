const es = new EventTarget()

es.addEventListener('a', () => {}, {})

class Mitt<T extends Record<string, any>> {
    #et = new EventTarget()

    on(key: keyof T, handler: Function) {
        this.#et.addEventListener(key as string, handler as any)
        return () => {
            this.#et.removeEventListener(key as string, handler as any)
        }
    }

    once(key: keyof T, handler: Function) {
        this.#et.addEventListener(key as string, handler as any, { once: true })
    }

    off(key: keyof T, handler: Function) {
        this.#et.removeEventListener(key as string, handler as any)
    }

    emit(key: keyof T, payload?: any) {
        this.#et.dispatchEvent(new CustomEvent(key as string, { detail: payload }))
    }
}

export default function mitt<T extends object>() {
    return new Mitt<T>()
}
