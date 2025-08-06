import { setupLocale } from '@/locales'
import { tryLogin } from './tryLogin'
import { queryAppInfo } from '@/api/app.api'
import { useApp } from '@/stores/app.store'

export default async function setup() {
    return Promise.all([tryLogin(), setupLocale(), queryApp()])
}

function queryApp() {
    const app = useApp()
    return queryAppInfo().then((info) => {
        app.appInfo = info
    })
}
