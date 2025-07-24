import type { GAME_PLATFORM } from '@/constants/game.config'

const dbName = 'dk85'
const dbVersion = 1
const tableName = 'game'
const log = (msg: string) => console.log('db', msg)

let table: IDBObjectStore
let promise: Promise<any> | null = null
let _failed = false

function connect(): Promise<IDBObjectStore> {
    if (promise) return promise
    if (table) return Promise.resolve(table)
    if (_failed) Promise.reject('open db failed!')

    promise = new Promise((resolve, reject) => {
        const request = window.indexedDB.open(dbName, dbVersion)
        request.onerror = function (event) {
            _failed = true
            log('数据库打开报错')
            reject('open db failed!')
        }

        request.onsuccess = function (event) {
            const db = request.result
            table = db.transaction([tableName], 'readwrite').objectStore(tableName)

            log('数据库打开成功')
            resolve(table)
            promise = null
        }
        request.onupgradeneeded = function (event) {
            const db = request.result
            if (db.objectStoreNames.contains(tableName)) {
                table = db.transaction([tableName], 'readwrite').objectStore(tableName)
            } else {
                table = db.createObjectStore(tableName, { keyPath: 'id' })
                table.createIndex('version', 'version', { unique: false })
                table.createIndex('json', 'json', { unique: true })
            }

            log('数据库版本升级成功')
        }
    })
    return promise
}

export default class DB {
    constructor(public platform: GAME_PLATFORM) {}

    async queryGames(version: string) {
        return connect()
            .then(() => this.#loadViaLocal(version))
            .catch(() => this.#loadViaRemote())
    }

    #loadViaLocal(version: string) {
        const request = table.get(this.platform)
        const promiser = Promise.withResolvers<any>()

        request.onsuccess = (e) => {
            if (request.result) {
                if (request.result.version === version) {
                    log('从db缓存获取成功')
                    promiser.resolve(request.result.json)
                } else {
                    log('版本不一致，从远端获取')
                    this.#loadAndSet(version, promiser)
                }
            } else {
                log('未获得数据记录')
                this.#loadAndSet(version, promiser)
            }
        }
        request.onerror = (e) => {
            log('事务失败')
            this.#loadAndSet(version, promiser)
        }
        return promiser.promise
    }

    async #loadViaRemote() {
        log('从远端获取')
        return { a: 1, b: 2 }
    }

    #loadAndSet(version: string, promiser: PromiseWithResolvers<any>) {
        this.#loadViaRemote()
            .then((data) => {
                table.put({ id: this.platform, version, json: data })
                promiser.resolve(data)
            })
            .catch(() => promiser.reject())
    }
}
