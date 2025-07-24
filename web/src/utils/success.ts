import { router } from '@/router'

export enum SUCCESS_TYPE {
    CREATED = 'created',
    DELETED = 'deleted',
    UPDATED = 'updated',
    BOUND = 'bound',
    SETTLE = 'settled',
}

export default function success(type: SUCCESS_TYPE) {
    router.replace(`/success/${type}`)
}

success.type = SUCCESS_TYPE
