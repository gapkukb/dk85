import stores from '@/stores'
import { useUser } from '@/stores/user.store'
import { login, LoginType } from '@/utils/login'
import { platfrom } from '@/utils/platform'
import { initialUrlParams } from '@/utils/url'
import { showToast } from 'vant/es'

export async function tryLogin() {
    const user = useUser()
    if (user.authenticated) return
    const params = Object.fromEntries(initialUrlParams.entries())
    // glife lazada跳转H5必须携带Token
    if (platfrom.glife || platfrom.lazada) {
        const token = initialUrlParams.get('isInfo')
        const loginName = initialUrlParams.get('loginName')

        if (token && loginName) {
            return user.login(LoginType.Ticket, params)
        }

        showToast(`Unknown user access`)
        return Promise.reject()
    }

    if (platfrom.app) {
        const ticket = initialUrlParams.get('ticket')
        const loginName = initialUrlParams.get('loginName')

        if (ticket && loginName) {
            return user.login(LoginType.Ticket, params)
        }
    }
}
