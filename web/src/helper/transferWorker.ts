import { zlibSync, strToU8 } from 'fflate'

export function transfer(data: any) {
    try {
        const buf = new Uint8Array(strToU8(JSON.stringify(data)))
        return zlibSync(buf)
    } catch (error) {
        console.error('转换失败')
    }
}
