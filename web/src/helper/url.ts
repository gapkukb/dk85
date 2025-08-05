function encode(input: any): string {
    if (typeof input !== 'string') {
        input = JSON.stringify(input)
    }
    input = window.encodeURI(input)
    return btoa(input)
}

function decode<T>(input: any): T {
    if (typeof input !== 'string') return input
    input = atob(input)
    input = window.decodeURI(input)
    input = JSON.parse(input)
    return input
}

export const URLHelper = {
    encode,
    decode,
}
