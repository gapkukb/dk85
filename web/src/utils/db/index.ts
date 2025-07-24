import { GAME_PLATFORM } from '@/constants/game.config'
import DB from './_DB'

export default {
    slots: new DB(GAME_PLATFORM.SLOTS),
    fishing: new DB(GAME_PLATFORM.FISHING),
    poker: new DB(GAME_PLATFORM.POKER),
    casino: new DB(GAME_PLATFORM.CASINO),
    lottery: new DB(GAME_PLATFORM.LOTTERY),
}
