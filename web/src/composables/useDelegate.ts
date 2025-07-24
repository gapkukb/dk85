function find(root: HTMLElement, current: any, attrs: string[]): [string, string, HTMLElement] | void {
    if (current === root) return
    if (current instanceof HTMLElement) {
        for (const attr of attrs) {
            const value = current.getAttribute(attr)
            if (value) return [value, attr, current]
        }
    }
    return find(root, current.parentElement, attrs)
}
/**
 * 
const delegate = useDelegate('data-day', (value, el) => {
    if (el.classList.contains('on')) return
    doCheckIn(value)
})
 */
export default function useDelegate<T extends string | string[]>({ attrs, hanlder }: { attrs: T; hanlder: R<T> }) {
    attrs = (Array.isArray(attrs) ? attrs : [attrs]) as any
    return function handle(e: MouseEvent) {
        console.log(e.currentTarget);
        
        // const result = find(e.currentTarget as HTMLElement, e.target, attrs as any)
        // result && hanlder(result[0], result[1] as any, result[2], e)
    }
}

type KeysOfMaybeArray<T> = T extends Array<any> ? T[number] : T
type R<T> = (value: string, attr: KeysOfMaybeArray<T>, el: HTMLElement, e: MouseEvent) => any
