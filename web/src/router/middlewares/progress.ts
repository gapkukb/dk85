import 'nprogress/nprogress.css'
//@ts-ignore
import nprogress from 'nprogress'
import type { Router } from 'vue-router'
nprogress.configure({ trickle: false })
/**
 * update html title description keywords
 */
export default function (router: Router): Router {
    router.beforeResolve(() => {
        nprogress.start()
    })
    router.afterEach(() => {
        nprogress.remove()
    })
    return router
}
