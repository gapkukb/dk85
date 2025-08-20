import { queryAllGame } from '@/api'
import { strToU8, zlibSync } from 'fflate'
import localforage from 'localforage'
import defined from './defined'

const store = localforage.createInstance({
    name: defined.dbName,
    driver: localforage.INDEXEDDB,
})

const key = defined.dbKey

interface GameLocalStorage {
    version: string | number
    value: Uint8Array
}

export default async function querGames(version: number | string) {
    const cached = await store.getItem<GameLocalStorage>(key)
    if (cached && cached.version === version) return cached.value
    const json = await queryAllGame({ game_id: 17 })
    const unit8 = strToU8(JSON.stringify(json))
    const binary = zlibSync(unit8)
    store.setItem(key, {
        version,
        value: binary,
    })
    return binary
}
