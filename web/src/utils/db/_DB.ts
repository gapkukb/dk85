import { queryAllGame } from '@/api/game.api'
import { GAME_TYPE } from '@/constants/game.const'

const dbName = 'dk85'
const dbVersion = 1
const tableName = 'game'
const log = (...msg: string[]) => console.log('db', ...msg)

let db: IDBDatabase
let table: IDBDatabase
let promise: Promise<any> | null = null
let _failed = false

function connect(): Promise<IDBDatabase> {
    if (promise) return promise
    if (db) return Promise.resolve(db)
    if (_failed) Promise.reject('open db failed!')

    promise = new Promise((resolve, reject) => {
        const request = window.indexedDB.open(dbName, dbVersion)
        request.onerror = function (event) {
            _failed = true
            log('数据库打开报错')
            reject('open db failed!')
        }

        request.onsuccess = function (event) {
            db = request.result
            // const table = db.transaction([tableName], 'readwrite').objectStore(tableName)

            log('数据库打开成功')
            resolve(db)
            promise = null
        }
        request.onupgradeneeded = function (event) {
            const db = request.result
            if (!db.objectStoreNames.contains(tableName)) {
                const table = db.createObjectStore(tableName, { keyPath: 'id' })
                table.createIndex('version', 'version', { unique: false })
                table.createIndex('json', 'json', { unique: true })
            }

            log('数据库版本变化')
        }
    })
    return promise
}

export default class DB {
    constructor(public gameType: string | number) {}

    async queryGames(version: string = '-1') {
        return connect().then(
            () => this.#loadViaLocal(version),
            () => this.#loadViaRemote()
        )
    }

    #loadViaLocal(version: string) {
        const request = this.#openTable().get(this.gameType.toString())
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
                log('未获得数据记录,从远端获取')
                this.#loadAndSet(version, promiser)
            }
        }
        request.onerror = (e) => {
            log('事务失败,从远端获取')
            this.#loadAndSet(version, promiser)
        }
        return promiser.promise
    }

    async #loadViaRemote() {
        log('从远端获取')
        return queryAllGame({ game_id: this.gameType })
    }

    #loadAndSet(version: string, promiser: PromiseWithResolvers<any>) {
        this.#loadViaRemote()
            .then((data) => {
                this.#openTable().put({ id: this.gameType, version, json: data })
                promiser.resolve(data)
            })
            .catch(() => promiser.reject())
    }

    #openTable() {
        return db.transaction([tableName], 'readwrite').objectStore(tableName)
    }
}
