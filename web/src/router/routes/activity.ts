import View from '@/app/Layout.vue'
import type { RouteRecordRaw } from 'vue-router'

export default <RouteRecordRaw[]>[
    {
        path: '/act',
        component: View,
        children: [
            {
                path: 'invitation',
                name: 'invitation',
                component: () => import('@/pages/activity/invitation/index.vue'),
            },
        ],
    },
]
