import type { RouteRecordRaw } from 'vue-router'
import home from './home'
import me from './me'
import demos from './demos'
import promos from './promos'
import funds from './funds'
import account from './account'
import turnover from './turnover'
import others from './others'
import activity from './activity'

export default <RouteRecordRaw[]>[home, promos, funds, me, turnover, ...account, ...others, ...activity].concat(import.meta.env.DEV ? demos : [])
