import type { Router } from 'vue-router'
import authenticate from './auth.middleware'
import keepAlive from './keepAlive.middleware'
import transitionName from './transitionName'
import TDK from './tdk.middleware'

export default function installMiddleware(router: Router) {
    transitionName(router)
    keepAlive(router)
    authenticate(router)
    // modal(router);
    // TDK(router);
}
