import type { MockConfig, MockMethod } from 'vite-plugin-mock'
import casual from 'casual'
import { User } from './user'

const username = 'a123456'
const password = 'a12345678'
const graphic = '1234'

export default function (config: MockConfig): MockMethod[] {
    return [
        {
            url: '/api/login',
            method: 'post',
            timeout: 300,
            async rawResponse(req, res) {
                let reqbody = ''
                await new Promise((resolve) => {
                    req.on('data', (chunk) => {
                        reqbody += chunk
                    })
                    req.on('end', () => resolve(undefined))
                })

                try {
                    const json = JSON.parse(reqbody)
                    if (json.username !== username) return res.error('用户名不正确')
                    if (json.password !== password) return res.error('密码不正确')
                    if (json.graphic !== graphic) return res.error('图形验证码不正确')

                    return res.ok({
                        token: 'ssssssssssssssssssssssssssssssss',
                        user: new User(),
                    })
                } catch (error: Error) {
                    res.error(error.message)
                }

                // if()
            },
        },
    ]
}
