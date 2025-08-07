declare namespace model.app {
    export interface AppInfo {
        code: string
        name: string
        register_time_interval: number
        switch_register: number
        is_close: number
        close_reason: string
        service_url: string
        agent_url: string
        mobile_url: string
        agent_register_url: string
        min_withdraw: number
        max_withdraw: number
        mobile_logo: string
        default_agent_id: number
        default_agent_name: string
        balance: string
        balance_reset: string
        version: string
    }

    export interface Notice {
        title: string
        url: string
        content: string
        created_at: string
    }

    export interface Adversite {
        name: string
        image: string
        url: string
        type: number
        before_login: number
        position: number
        sort: number
    }
}
