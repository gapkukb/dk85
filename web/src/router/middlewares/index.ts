import type { Router } from 'vue-router'
import authenticate from './auth.middleware'
import transitionName from './transitionName'
import modal from './modal.middleware'
import TDK from './tdk.middleware'

export default function installMiddleware(router: Router) {
    transitionName(router)
    authenticate(router)
    // modal(router);
    // TDK(router);
}
