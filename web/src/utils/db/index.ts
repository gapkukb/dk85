import { GAME_TYPE } from '@/constants/game.const'
import DB from './_DB'

export default {
    slots: new DB(GAME_TYPE.SLOTS),
    fishing: new DB(GAME_TYPE.FISHING),
    poker: new DB(GAME_TYPE.POKER),
    all: new DB('17'),
    // casino: new DB(GAME_TYPE.CASINO),
    // lottery: new DB(GAME_TYPE.LOTTERY),
}
