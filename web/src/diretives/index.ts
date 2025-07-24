import type { App } from 'vue'
import clipboard from './clipboard'

const dirs = {
    clipboard,
} as const

export default function install(app: App) {
    for (const [name, dir] of Object.entries(dirs)) {
        app.directive(name, dir)
    }
}

declare module 'vue' {
    interface ComponentCustomProperties {
        vClipboard: typeof clipboard
    }
}
