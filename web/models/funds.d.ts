declare namespace model.funds {
    export interface PaymentProvider {
        activity_list: any[]
        account_list: Channel[]
    }

    export interface Channel {
        id: number
        gateway: number
        each_min: string
        each_max: string
        domain: string
        is_select_bank: number
        is_decimal: number
        is_int: number
        moneyList: string[]
        sort: number
        key: string
        name: string
        remark: string
        is_input: number
        logo: stirng
    }

    export interface PaymentResult {
        channel_card_no: string
        channel_name: string
        code: number
        order_sn: string
        result: string
        sys_trade_no: string
        image_url: string
    }
}
