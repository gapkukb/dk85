// import 'virtual:vite-svg-2-webfont.css';
window.addEventListener(
    'error',
    function (event) {
        if (event.target instanceof HTMLImageElement) {
            event.target.classList.add('_img_error')
        }
    },
    true
)

// import 'virtual:uno.css'
import './styles'
import './http/index'
import { createApp } from 'vue'
import { VueQueryPlugin } from '@tanstack/vue-query'
import { MotionPlugin } from '@vueuse/motion'
import stores from './stores'
import bootstrap from './bootstrap'
import App from './app/index.vue'
import { i18n } from './locales'
import { router } from './router'
import startup from './startup'
import diretives from './diretives'
import { Lazyload } from 'vant'
import db from './utils/db'

await bootstrap()
const app = createApp(App)
app.use(stores).use(VueQueryPlugin).use(i18n).use(router).use(diretives).use(MotionPlugin).use(Lazyload)
await startup()
app.mount('#app')

// db.slots.queryGames('1231').then(console.log)
// db.slots.queryGames('1231').then(console.log)
// db.slots.queryGames('1231').then(console.log)
// db.poker.queryGames('456').then(console.log)
// db.fishing.queryGames('789').then(console.log)
