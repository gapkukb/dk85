import { ServerResponse } from 'http'
import type { MockConfig, MockMethod } from 'vite-plugin-mock'
import casual from 'casual'


function array(length = 1, generator: any) {
    return Array.from({ length })
        .fill(0)
        .map(() => generator())
}

export default function (config: MockConfig): MockMethod[] {
    return [
        {
            url: '/api/activities',
            method: 'get',
            timeout: 1000,
            rawResponse(req, res) {
                res.ok(array(10, item))
            },
        },
        {
            url: '/api/clainmed/list',
            method: 'get',
            timeout: 1000,
            rawResponse(req, res) {
                res.ok(array(10, item))
            },
        },
    ]
}

const item = () => ({
    id: casual.uuid,
    title: casual.title,
    company: casual.company_name,
    ip: casual.ip,
    email: casual.email,
    name: casual.name,
    phone: casual.phone,
    address: casual.address,
    amount: casual.integer(0, 1000),
    double: casual.double(0, 1000),
    dateTime: casual.date('YYYY-MM-DD HH:mm:ss'),
    text: casual.text,
    description: casual.description,
    image:`https://picsum.photos/id/${casual.integer(0,1000)}/200/300`
})
