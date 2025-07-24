import { resolve } from 'node:path'
import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import jsx from '@vitejs/plugin-vue-jsx'
import Icons from 'unplugin-icons/vite'
import AutoImport from 'unplugin-auto-import/vite'
import Components from 'unplugin-vue-components/vite'
import { VantResolver } from 'unplugin-vue-components/resolvers'
import IconsResovler from 'unplugin-icons/resolver'
import basicSsl from '@vitejs/plugin-basic-ssl'
// import UnoCSS from 'unocss/vite'
import { include, exclude } from './build/optimize'
import autoimportLocale from './build/autoimport-locale'
import { version } from './package.json'
import mock from './mock/plugin'
import { VitePWA } from 'vite-plugin-pwa'
import svgLoader from 'vite-svg-loader'

export default defineConfig(function configure() {
    return {
        define: {
            'import.meta.env.PACKAGE_VERSION': JSON.stringify(version),
        },
        resolve: {
            alias: {
                '@': resolve(__dirname, 'src'),
            },
        },
        plugins: [
            VitePWA(),
            svgLoader({
                svgoConfig: {
                    multipass: true,
                    plugins: [
                        // {
                        //     name: 'preset-default',
                        //     params: {
                        //         overrides: {
                        //             // convertColors: {
                        //             //     currentColor: true,
                        //             // },
                        //             cleanupIds: { remove: true },
                        //             // mergePaths: { force: true },
                        //         },
                        //     },
                        // },
                        // {
                        //     name: 'addAttributesToSVGElement',
                        //     params: {
                        //         // attribute: { fill: 'currentColor' },
                        //     },
                        // },
                        // {
                        //     name: 'removeDimensions',
                        // },
                    ],
                },
            }),
            // basicSsl(),
            vue(),
            jsx(),
            Components({
                dirs: ['./src/composables', './src/components', './src/utils', './src/locales'],
                dts: 'typings/components.d.ts',
                deep: true,
                globs: ['**/index.{vue,ts,tsx}'],
                resolvers: [IconsResovler({}), VantResolver()],
            }),
            AutoImport({
                dts: 'typings/auto-imports.d.ts',
                include: [
                    /\.[tj]sx?$/, // .ts, .tsx, .js, .jsx
                    /\.vue$/,
                    /\.vue\?vue/, // .vue
                ],
                imports: [
                    'vue',
                    'pinia',
                    'vue-router',
                    // '@vueuse/core',

                    // {
                    //   'swiper-next/vue': [['Swiper', 'SwiperNext'], ['SwiperSlide', 'SwiperSlideNext'], 'useSwiper', 'useSwiperSlide'],
                    // },
                ],
                resolvers: [autoimportLocale],
            }),
            Icons(),
            // UnoCSS(),
            mock,
        ],
        build: {
            rollupOptions: {},
        },
        optimizeDeps: {
            include,
            exclude,
        },
        server: {
            // https: {},
            host: '0.0.0.0',
            warmup: {
                clientFiles: ['./index.html', './src/{pages,components,composables,api}/*'],
            },
        },
    }
})
