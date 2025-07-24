const _keys = {
    app: 'app',
    locale: 'locale',
    search: 'search',
    bgm: 'bgm',
    currentUser: 'current_user',
} as const

export type StorageKeys = EnumLike<typeof _keys>

export default _keys
