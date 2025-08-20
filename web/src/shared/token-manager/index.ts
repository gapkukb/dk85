import { ls, useLs } from '@/storage'

export default class TokenManager {
    static accessToken = useLs<null | string>(ls.keys.accessToken)
    static refreshToken: null | string = ls.get(ls.keys.refreshToken)

    static set(_accessToken: string | null = null, _refreshToken: string | null = null) {
        _accessToken = !!_accessToken ? 'Bearer ' + _accessToken : _accessToken
        this.accessToken.value = _accessToken
        this.refreshToken = _refreshToken
        ls.set(ls.keys.accessToken, _accessToken)
        ls.set(ls.keys.refreshToken, _refreshToken)
    }

    static clear() {
        this.accessToken.value = null
        this.refreshToken = null
        ls.remove(ls.keys.accessToken)
        ls.remove(ls.keys.refreshToken)
    }
}
