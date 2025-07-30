import type { MockConfig, MockMethod } from 'vite-plugin-mock'
import casual from 'casual'
import { User } from './user'

let token = ''
const f = () => {
    token = Math.random().toString(32)
}
setInterval(f, 10000)

export default function (config: MockConfig): MockMethod[] {
    return [
        {
            url: '/api/login',
            method: 'post',
            timeout: 300,
            async rawResponse(req, res) {
                f()
                res.ok({ token })
            },
        },
        {
            url: '/api/protected',
            method: 'get',
            timeout: 300,
            async rawResponse(req, res) {
                const t = req.headers.authorization
                if (t === token) {
                    res.ok('受保护内容')
                } else {
                    res.error('登录失效', 666, 200)
                }
            },
        },
        {
            url: '/api/refresh',
            method: 'post',
            timeout: 300,
            async rawResponse(req, res) {
                res.error('登录失效', 666, 200)
            },
        },
    ]
}
