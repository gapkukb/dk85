import { createWebHistory, createRouter, type Router, type RouteLocationAsRelativeGeneric } from 'vue-router'
import type { App } from 'vue'
import routes from './routes'
console.log(routes);

import installMiddleware from './middlewares'

const router = createRouter({
    history: createWebHistory('/'),
    routes,
    scrollBehavior(to, from, savedPosition) {},
})

installMiddleware(router)

const install = router.install
router.install = function (app: App) {
    Object.defineProperties(router, {
        pushNamed: {
            value(this: Router, to: string | RouteLocationAsRelativeGeneric) {
                if (typeof to === 'string') {
                    return this.push({
                        name: to,
                    })
                }
                return this.push(to)
            },
        },
        replaceNamed: {
            value(this: Router, to: string | RouteLocationAsRelativeGeneric) {
                if (typeof to === 'string') {
                    return this.replace({
                        name: to,
                    })
                }
                return this.replace(to)
            },
        },
    })
    install.call(router, app)
}

export default router
