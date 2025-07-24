import type { RouteRecordRaw } from 'vue-router'

export default <RouteRecordRaw[]>[{ path: '/demos/captha', component: () => import('@/demos/captha.vue') }]
