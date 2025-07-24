import View from '@/app/Layout.vue'
import type { RouteRecordRaw } from 'vue-router'

export default <RouteRecordRaw>{
    path: '/wallet',
    component: View,
    children: [
        {
            path: '',
            name: 'wallet',
            component: () => import('@/pages/wallet/index.vue'),
            redirect: '/wallet/deposit',
            meta: {
                footer: true,
                // requiredAuth: true,
            },
            children: [
                // {
                //     path: '',
                //     name: 'wallet',
                //     meta: {
                //         footer: true,
                //     },
                //     component: () => import('@/pages/wallet/index.vue'),
                // },
                {
                    path: 'deposit',
                    name: 'deposit',
                    component: () => import('@/pages/wallet/Deposit.vue'),
                },
                {
                    path: 'withdrawal',
                    name: 'withdrawal',
                    component: () => import('@/pages/wallet/Withdrawal.vue'),
                },
            ],
        },
        {
            path: '/wallet/deposit/confirmation',
            name: 'confirmation',
            component: () => import('@/pages/wallet/DepositConfirmation.vue'),
        },
        {
            path: '/wallet/withdrawal/confirmation',
            name: 'confirmation',
            component: () => import('@/pages/wallet/DepositConfirmation.vue'),
        },
    ],
}
