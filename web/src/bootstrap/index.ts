import '@/utils/fixFullHeight'
import './polyfill'
import 'vant/es/popup/style'
import 'vant/es/dialog/style'
import 'vant/es/toast/style'
import { t } from '@/locales'

window.t = t

export default async function bootstrap() {
    return Promise.all([emulator()])
}

async function emulator() {
    if ('touchstart' in window) return
    //@ts-expect-error
    return import('@vant/touch-emulator')
}
