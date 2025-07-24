import type { RouteRecordRaw } from 'vue-router'

export default <RouteRecordRaw[]>[
    {
        path: '/success/:type',
        name: 'success',
        props: true,
        component: () => import('@/pages/success/index.vue'),
    },
    {
        path: '/trends',
        name: 'Trends',
        component: () => import('@/pages/trends/index.vue'),
    },
    {
        path: '/search',
        name: 'search',
        component: () => import('@/pages/search/index.vue'),
    },
]
