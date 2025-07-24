let w = window.innerWidth
export function rpx(n: any) {
    n = Number(n)
    if (!n) return 0
    return (n / 375) * w
}
