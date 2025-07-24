export const appPages = {}
export const _Paths = {
    home: '/home',
    products: '/products',
    profile: '/profile',
    settings: '/settings',
    productDetails: '/:productId',
    login: '/login',
    dashboard: '/dashboard',
}

const routes = {
    home: _Paths.home,
    profile: _Paths.home + _Paths.profile,
    settings: _Paths.settings,
    products: _Paths.home + _Paths.products,
    login: _Paths.login,
    dashboard: _Paths.home + _Paths.dashboard,
}

class Page {
    private parentPath = ''
    path!: string
    name!: string
    constructor(path: string, name?: string) {
        this.path = path
        this.name = name || path
    }

    child(path: string, name?: string) {
        return new Page(this.path + path, name)
    }
}

/** 存款 */
const home = new Page('/', 'home')
const foru = home.child('', 'foru')
const slot = home.child('slot')
const fishing = home.child('fishing')
const poker = home.child('poker')
const casino = home.child('casino')

const bonus = new Page('bonus')


const wallet = new Page('wallet')
const deposit = wallet.child('deposit')

const pages = {
    home,
    foru,
} as const


