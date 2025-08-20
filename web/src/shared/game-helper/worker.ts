import { unzlibSync, strFromU8 } from 'fflate'
import defined from './defined'

let gamesObject!: model.game.GamesObject
let gamesList!: model.game.Game[]

self.onmessage = async function (e) {
    const { type, ...options } = e.data
    let result: any
    if (type === defined.getAll) {
        result = gamesObject
    } else if (type === defined.set) {
        result = set(options.value)
    } else if (type === defined.query) {
        result = await filter(options)
    }

    e.ports[0].postMessage(result)
}

async function filter({ keywords, kind, platforms }: { keywords?: string; kind?: string; platforms?: string[] }) {
    keywords = keywords?.toLowerCase()
    platforms = platforms?.map((i) => i.toLowerCase())

    let result: model.game.Game[] = []

    function include(x: string) {
        return x.toLowerCase().includes(keywords!)
    }

    function includes(item: model.game.Game) {
        return include(item.name) || include(item.platform) || include(item.vendor) || include(item.style)
    }
    // 先按类型筛选
    if (kind) {
        result = gamesObject[kind as keyof typeof gamesObject] || []
    } else {
        result = gamesList
    }

    if (platforms?.at(0)) {
        result = result.filter((item) => platforms.includes(item.platform.toLowerCase()))
    }

    if (keywords) {
        result = result.filter(includes)
    }

    return result
}

function set(value: Uint8Array) {
    const s = strFromU8(unzlibSync(value))
    gamesObject = JSON.parse(s)
    gamesList = Object.values(gamesObject).flat()
    return true
}
