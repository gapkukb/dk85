declare namespace model.game {
    export interface GamesObject {
        FISH: Game[]
        SLOTS: Game[]
        POKER: Game[]
        MINI: Game[]
    }

    export interface Game {
        platform: string
        name: string
        style: 'FISH' | 'MINI' | 'POKER' | 'SLOTS'
        img: string
        img1: string
        device: string
        vendor: string
        code: string
        language: string
        currency: string
        hot: number
        recommend: number
        like_num: number
        new: number
        created_at: string
        updated_at: string
    }
}
