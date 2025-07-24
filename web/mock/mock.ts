import { ServerResponse } from 'http'
import type { MockConfig, MockMethod } from 'vite-plugin-mock'
import { User } from './user'
import dayjs from 'dayjs'
import casual from 'casual'

declare module 'stream' {
    interface Writable {
        ok(data: any): void
        error(message: string, code?: number, httpCode?: number): void
    }
}

ServerResponse.prototype.ok = function (data) {
    this.setHeader('Content-Type', 'application/jsonxml; charset=utf-8')
    this.end(JSON.stringify({ code: 200, msg: null, data: data }))
}

ServerResponse.prototype.error = function (message: string, code = 400,httpCode = 200) {
    this.setHeader('Content-Type', 'application/jsonxml; charset=utf-8')
    this.statusCode = httpCode
    this.end(JSON.stringify({ code, msg: message, data: null }))
}

let date = 15

export default function (config: MockConfig): MockMethod[] {
    return [
        {
            url: '/api/login',
            method: 'post',
            timeout: 3000,
            response: {
                code: 200,
                data: 'fasf',
                msg: '',
            },
        },
        {
            url: '/api/otp',
            method: 'post',
            timeout: 1000,
            response: {
                code: 200,
                data: '010086',
                msg: '',
            },
        },
        {
            url: '/api/user',
            method: 'get',
            timeout: 1000,
            response: {
                code: 200,
                data: new User(),
                msg: '',
            },
        },
        {
            url: '/api/balance',
            method: 'get',
            timeout: 1000,
            rawResponse(req, res) {
                res.ok(casual.integer(0, 1000))
            },
        },

        {
            url: '/api/check-in',
            method: 'get',
            timeout: 1000,
            rawResponse(req, res) {
                const firstDay = dayjs().set('date', 1)

                const data = Array.from({ length: dayjs().daysInMonth() })
                    .fill(0)
                    .map((_, i) => ({
                        date: dayjs(firstDay.add(i, 'day')).format('YYYY-MM-DD HH:mm:ss'),
                        status: i < date ? 0 : i === date ? 1 : 2,
                    }))

                res.ok({
                    code: 200,
                    data: data,
                    msg: '',
                })
            },
        },
        {
            url: '/api/check-in',
            method: 'post',
            timeout: 1000,
            rawResponse(req, res) {
                date++
                res.ok({
                    code: 400,
                    data: 1,
                    msg: '请不要重复领取',
                })
            },
        },
    ]
}
