import { setLocale, locale } from '@/locales'
import { tryLogin } from './tryLogin'
import { queryAppInfo } from '@/api/app.api'
import { useApp } from '@/stores/app.store'

export default async function startup() {
    return Promise.all([tryLogin(), setLocale(locale.value), queryApp()])
}

function queryApp() {
    const app = useApp()
    return queryAppInfo().then((info) => {
        app.appInfo = info
    })
}
