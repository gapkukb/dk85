import type { RouteRecordRaw } from 'vue-router'
import names from '../names'

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
    {
        path: '/records',
        component: () => import('@/pages/records/index.vue'),
        redirect: '/records/topup',
        children: [
            {
                path: 'topup',
                name: names.topupHistory,
                component: () => import('@/pages/records/deposit.vue'),
            },
            {
                path: 'withdraw',
                name: names.withdrawHistory,
                component: () => import('@/pages/records/withdraw.vue'),
            },
        ],
    },
    {
        path: '/history',
        component: () => import('@/pages/history/index.vue'),
        redirect: '/history/funds',
        children: [
            {
                path: 'funds',
                name: names.fundRecords,
                component: () => import('@/pages/history/funds.vue'),
            },
            {
                path: 'game',
                name: names.gameRecords,
                component: () => import('@/pages/history/game.vue'),
            },
        ],
    },
]
