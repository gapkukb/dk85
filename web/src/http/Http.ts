import axios, { mergeConfig, type AxiosInstance, type AxiosRequestConfig, type CreateAxiosDefaults, type Method } from 'axios'

type HttpMethd = Extract<Lowercase<Method>, 'get' | 'post' | 'put' | 'delete'>
type HttpMethdFunc = <Res = any, Req = any>(path: string, config?: RequestConfig) => (payload?: Req, config?: RequestConfig) => Promise<Res>

export interface RequestConfig extends AxiosRequestConfig {
    [key: string | number | symbol]: any
}
export default class Http {
    inst!: AxiosInstance
    // declare get: HttpMethdFunc
    // declare post: HttpMethdFunc
    // declare put: HttpMethdFunc
    // declare del: HttpMethdFunc

    constructor(option: CreateAxiosDefaults) {
        this.inst = axios.create(option)
    }

    use(plugin: (http: this) => any) {
        plugin(this)
    }

    eject() {
        this.inst.interceptors.response.eject(0)
    }

    copyWith(option: CreateAxiosDefaults) {
        const clone = <T extends object>(to: T, from: T) => {
            const k = 'handlers'
            Reflect.set(to, k, Array.from(Reflect.get(from, k) as Array<any>))
        }

        const newer = new Http({
            ...this.inst.defaults,
            ...option,
        })

        clone(newer.inst.interceptors.request, this.inst.interceptors.request)
        clone(newer.inst.interceptors.response, this.inst.interceptors.response)

        return newer
    }

    get = this.create('get')
    post = this.create('post')
    put = this.create('put')
    delete = this.create('delete')

    private create(method: HttpMethd): HttpMethdFunc {
        const key: keyof AxiosRequestConfig = method === 'get' ? 'params' : 'data'
        const _this = this as Http
        return function wrap<Res = any, Req extends Record<string | number, any> | unknown = unknown>(this: Http, url: string, wrapperOption?: RequestConfig) {
            return function dispatch(payload?: Req, option?: RequestConfig) {
                if (wrapperOption && option) {
                    option = mergeConfig(wrapperOption, option)
                } else {
                    option ||= wrapperOption
                }

                return _this.inst.request<Req, Res>({
                    method,
                    url,
                    [key]: payload,
                    ...option,
                })
            }
        }
    }
}
