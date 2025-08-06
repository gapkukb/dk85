const _keys = {
    completeProfile: 'complete_profile',
    newbieGuide: 'newbie_guide',
    app: 'app',
    locale: 'locale',
    search: 'search',
    bgm: 'bgm',
    currentUser: 'current_user',
} as const

export type StorageKeys = EnumLike<typeof _keys>

export default _keys
