import type { RouteRecordRaw } from 'vue-router'

export default <RouteRecordRaw[]>[
    {
        path: '/recover',
        name: 'recover',
        component: () => import('@/pages/recover/index.vue'),
    },
]
