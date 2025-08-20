import { castArray } from 'lodash-es'
import broker from './broker'
import { useApp } from '@/stores/app.store'

type R = Promise<model.game.Game[]>

export abstract class GamesHelper {
    static queryAll() {
        return broker.getAll()
    }
    static queryByKind(kind: string): R {
        return this.queryBy(undefined, kind)
    }
    static queryByPlatorm(platform: string): R {
        return this.queryByPlatorms([platform])
    }
    static queryByPlatorms(platforms: string[]): R {
        return this.queryBy(undefined, undefined, platforms)
    }
    static queryBy(keyword?: string, kind?: string, platforms?: string | string[]): R {
        return broker.query(keyword, kind, castArray(platforms))
    }
}
