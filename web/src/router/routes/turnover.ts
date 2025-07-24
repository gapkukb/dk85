import Layout from '@/app/Layout.vue'
import type { RouteRecordRaw } from 'vue-router'

export default <RouteRecordRaw>{
    path: '/turnover',
    component: Layout,
    children: [
        {
            path: '',
            name: 'turnover',
            component: () => import('@/pages/turnover/index.vue'),
        },
        {
            path: 'history',
            name: 'history',
            meta: { title: 'page.turnoverhistory' },
            component: () => import('@/pages/turnover/History.vue'),
        },
    ],
}
