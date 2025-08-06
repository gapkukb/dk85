import { useApp } from '@/stores/app.store'
import type { RouteLocationNormalizedGeneric, RouteLocationNormalizedLoadedGeneric, RouteMeta, Router, RouteRecordNormalized } from 'vue-router'

export default function (router: Router): Router {
    function include(to: RouteLocationNormalizedGeneric, from: RouteLocationNormalizedGeneric) {
        if (to.fullPath.includes(from.fullPath)) return true
        return from.matched.at(-1)?.children?.some((i) => i.name === to.name || i.path === to.path)
    }

    router.beforeResolve((to, from) => {
        const app = useApp()
        if (from.name && include(to, from)) {
            app.keepAlives.push(from.name as string)
        } else {
            setTimeout(() => {
                app.keepAlives = app.keepAlives.filter(i=>i!==to.name)
                console.log(app.keepAlives)
            }, 0)
        }
    })

    return router
}
