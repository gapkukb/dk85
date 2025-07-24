import View from '@/app/View.vue'
import type { RouteRecordRaw } from 'vue-router'

export default <RouteRecordRaw>{
    path: '/me',
    meta: {
        // requiredAuth:true,
    },
    component: View,
    children: [
        {
            path: '',
            name: 'me',
            meta: {
                footer: true,
            },
            component: () => import('@/pages/me/index.vue'),
        },
        {
            path: 'account',
            name: 'account',
            meta: { title: 'page.account' },
            component: () => import('@/pages/me/account/index.vue'),
        },
        {
            path: 'more',
            name: 'more',
            meta: { title: 'page.more' },
            component: () => import('@/pages/me/more/index.vue'),
        },
        {
            path: 'real-name',
            name: 'realName',
            meta: { title: 'page.realname' },
            component: () => import('@/pages/me/real-name/index.vue'),
        },
        {
            path: 'bind-phone',
            name: 'bindPhone',
            meta: { title: 'page.bindPhone' },
            component: () => import('@/pages/me/bind-phone/index.vue'),
        },
        {
            path: 'update-phone',
            name: 'updatePhone',
            meta: { title: 'page.updatePhone' },
            component: () => import('@/pages/me/update-phone/index.vue'),
        },
        {
            path: 'update-password',
            name: 'updatePassword',
            meta: { title: 'page.udpatePassword' },
            component: () => import('@/pages/me/update-password/index.vue'),
        },
        {
            path: 'bind-email',
            name: 'bindEmail',
            meta: { title: 'page.bindEmail' },
            component: () => import('@/pages/me/bind-email/index.vue'),
        },
        {
            path: 'update-email',
            name: 'updateEmail',
            meta: { title: 'page.updateEmail' },
            component: () => import('@/pages/me/update-email/index.vue'),
        },
        {
            path: '/vip',
            component: View,
            children: [
                {
                    path: '',
                    name: 'vip',
                    component: () => import('@/pages/me/vip/index.vue'),
                },
                {
                    path: 'details',
                    name: 'vip-details',
                    meta: { title: 'page.vipDetails' },
                    component: () => import('@/pages/me/vip/VipDetails.vue'),
                },
            ],
        },
        {
            path: 'favorites',
            name: 'favorites',
            meta: { title: 'page.favorites' },
            component: () => import('@/pages/me/favorites/index.vue'),
        },
        {
            path: '/messages',
            name: 'messages',
            component: () => import('@/pages/messages/index.vue'),
        },
        {
            path: '/message/:id',
            name: 'message',
            component: () => import('@/pages/messages/Detail.vue'),
        },
    ],
}
