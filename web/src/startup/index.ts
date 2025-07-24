import { setLocale, locale } from '@/locales'
import { tryLogin } from './tryLogin'

export default async function startup() {
    return Promise.all([tryLogin(), setLocale(locale.value)])
}
