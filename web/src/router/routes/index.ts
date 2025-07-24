import type { RouteRecordRaw } from 'vue-router'
import home from './home'
import me from './me'
import demos from './demos'
import promos from './promos'
import wallet from './wallet'
import account from './account'
import turnover from './turnover'
import others from './others'
import activity from './activity'

export default <RouteRecordRaw[]>[home, promos, wallet, me, turnover, ...account, ...others, ...activity].concat(import.meta.env.DEV ? demos : [])
