import Provider from './Provider'
import MemoryStorage from './Memory'

export { default as keys } from '../keys'
export { Provider }

function supportsLocalStorage() {
    try {
        const testKey = '__test__'
        sessionStorage.setItem(testKey, 'test')
        sessionStorage.removeItem(testKey)
        return true
    } catch (e) {
        return false
    }
}

const supported = supportsLocalStorage()

export function createLocal() {
    return new Provider(supported ? window.localStorage : new MemoryStorage())
}

export function createSession() {
    return new Provider(supported ? window.localStorage : new MemoryStorage())
}
