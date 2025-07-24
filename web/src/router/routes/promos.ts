import type { RouteRecordRaw } from 'vue-router'

export default <RouteRecordRaw>{
    path: '/promos',
    name: 'promos',
    meta: {
        footer: true,
        title: 'Promos',
    },
    component: () => import('@/pages/promos/index.vue'),
}
