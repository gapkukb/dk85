import View from '@/app/Layout.vue'
import type { RouteRecordRaw } from 'vue-router'

export default <RouteRecordRaw>{
    path: '/funds',
    meta: {
        protected: true,
    },
    component: View,
    children: [
        {
            path: '',
            name: 'funds',
            component: () => import('@/pages/funds/index.vue'),
            redirect: '/funds/deposit',
            meta: {
                footer: true,
            },
            children: [
                {
                    path: 'deposit',
                    name: 'deposit',
                    component: () => import('@/pages/funds/Deposit.vue'),
                },

                {
                    path: 'withdrawal',
                    name: 'withdrawal',
                    component: () => import('@/pages/funds/Withdrawal.vue'),
                },
            ],
        },
        {
            path: '/confirmation',
            name: 'confirmation',
            component: () => import('@/pages/funds/DepositConfirmation.vue'),
        },
        {
            path: '/funds/records',
            name: 'confirmation',
            component: () => import('@/pages/records/index.vue'),
        },
    ],
}
