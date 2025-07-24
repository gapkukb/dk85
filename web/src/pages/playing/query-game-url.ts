export default async function queryGameUrl(prams: GameParams) {
    await Promise.delay(3000)
    return 'https://google.com.ph'
}

interface GameParams {}
