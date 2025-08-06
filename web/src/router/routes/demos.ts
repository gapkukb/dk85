import type { RouteRecordRaw } from 'vue-router'

export default <RouteRecordRaw[]>[
    { path: '/demos/captha', component: () => import('@/demos/captha.vue') },
    { path: '/demos/login', component: () => import('@/pages/authentication/index.vue') },
    { path: '/demos/modals', component: () => import('@/demos/Modals.vue') },
]
