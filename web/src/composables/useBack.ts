import { APP_ROUTES } from '@/constants/app.const'
import { backToApp } from '@/utils/backToApp'
import { platfrom } from '@/utils/platform'
import { useRouter } from 'vue-router'

export type PlatformRoute = { webview?: APP_ROUTES; web?: string }

export function useBack(targets?: PlatformRoute | string, replacement = false) {
    const router = useRouter()

    const route: PlatformRoute = targets ? (typeof targets === 'string' ? { web: targets } : targets) : {}

    return function handle() {
        if (platfrom.app) {
            return backToApp(route.webview || APP_ROUTES.back)
        }

        if (route.web) {
            replacement ? router.replace(route.web) : router.push(route.web)
        } else if (window.history.state.back) {
            router.back()
        } else if (replacement) {
            router.replace('/')
        } else {
            router.push('/')
        }
    }
}
