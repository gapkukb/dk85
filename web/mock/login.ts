import type { MockConfig, MockMethod } from 'vite-plugin-mock'
import casual from 'casual'
import { User } from './user'

let token = ''
let refreshtoken = ''

export default function (config: MockConfig): MockMethod[] {
    return [
        {
            url: '/api/login',
            method: 'post',
            timeout: 2000,
            async rawResponse(req, res) {
                token = Math.random().toString(32)
                refreshtoken = Math.random().toString(32)
                res.ok({ token, refreshtoken })
                setTimeout(() => {
                    token = ''
                }, 7000)
            },
        },
        {
            url: '/api/protected',
            method: 'get',
            timeout: 2000,
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
            timeout: 2000,
            async rawResponse(req, res) {
                const t = req.headers.authorization
                token = Math.random().toString(32)
                res.ok(token)
                setTimeout(() => {
                    token = ''
                }, 7000);
            },
        },
    ]
}
