function cid() {
    return (Math.random() * Math.random()).toString(32).substring(2)
}

export function cuid(length?: number) {
    if (length === void 0) return cid()
    let id = ''
    do {
        id += cid()
    } while (id.length < length)

    return id.substring(0, length)
}

