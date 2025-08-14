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

    export interface Mocked {
        gameDetailId: number
        gameName: string
        gameState: number
        gameApiName: string
        gameIcon: string
        likeCount: number
        isNew: boolean
        isHot: boolean
        hasFav: boolean
    }
    export interface Record {
        id: number
        game_no: string
        inning_no: string
        externalTransactionId: string
        username: string
        currencyCode: string
        gameCode: string
        vendorCode: string
        gameCategoryCode: string
        bet_amount: string
        winAmount: string
        win: string
        valid_amount: string
        jackpotAmount: number
        bet_status: number
        bet_time: Date
        vendorSettleTime: number
        isFreeSpin: number
        vendorBetId: string
        created_at: Date
        updated_at: Date
    }
}
