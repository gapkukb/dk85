import Layout from '@/app/Layout.vue'
import type { RouteRecordRaw } from 'vue-router'
import { pagesName } from '..'

export default <RouteRecordRaw>{
    path: '/turnover',
    component: Layout,
    children: [
        {
            path: '',
            name: pagesName.turnover,
            component: () => import('@/pages/turnover/index.vue'),
        },
        {
            path: 'history',
            name: pagesName.turnoverHistory,
            meta: { title: 'page.turnoverhistory' },
            component: () => import('@/pages/turnover/History.vue'),
        },
    ],
}
