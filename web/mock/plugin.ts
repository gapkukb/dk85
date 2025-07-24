import { viteMockServe } from 'vite-plugin-mock'

export default viteMockServe({
    // default
    mockPath: 'mock',
    enable: true,
})
