import {
    defineConfig,
    presetWind3,
    presetAttributify,
    transformerDirectives,
    transformerVariantGroup,
    transformerCompileClass,
    transformerAttributifyJsx,
} from 'unocss'
import { presetRemToPx } from '@unocss/preset-rem-to-px'


export default defineConfig({
    content: {
        filesystem: ['./src/**/*.{vue,tsx,ts,html,js,jsx}'],
    },

    presets: [presetAttributify({}), presetWind3(), presetRemToPx({ baseFontSize: 4 })],
    transformers: [transformerAttributifyJsx(), transformerDirectives(), transformerVariantGroup(), transformerCompileClass()],
    theme: {
        colors: {
            primary: '#ff5800',
        },
    },
    rules: [
        [/^expand-(\d+)$/, ([, d]) => ({ margin: `-${d}pxmax`, padding: `${d}px` })],
        [/^fs-(\d+)$/, ([, d]) => ({ 'font-size': `${d}px` })],
    ],
})
