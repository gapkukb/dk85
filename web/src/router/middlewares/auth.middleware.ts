import { Modals, ModalsName } from '@/modals'
import { useUser } from '@/stores/user.store'
import type { Router } from 'vue-router'

/**
 * update html title description keywords
 */
export default function (router: Router): Router {
    router.beforeResolve((to, from) => {
        const user = useUser()
        if (to.matched.some((route) => route.meta.requiredAuth) && !user.authenticated) {
            Modals.open(ModalsName.login)
            return from
        }
    })
    return router
}
