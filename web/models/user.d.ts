declare namespace model.user {
    namespace vo {
        interface Login {
            token: string
            refreshToken: string
            user: User
        }
    }

    interface Balance {
        balance: number
        balance_frozen: number
        points: number
    }

    interface User {
        username: string
        realname: string
        email: null
        mobile: string
        qq: null
        sex: number
        birthday: Date
        last_login_time: Date
        last_login_address: string
        show_beginner_guide: number
        gpwd: string
        balance: string
        balance_frozen: string
        points: number
        grade_id: number
        grade_name: string
        bind_safe_question: number
        bind_pay_password: number
        unread_message_count: number
        switch_sign: string
        bind_bank: number
        apply_birthday_bonus: number
        auto_bind_game_balance: number
        total_bet: string
        total_bonus: string
        total_rebate: string
        last_recharge: UserLast
        last_withdraw: UserLast
        last_message: UserLastMessage
    }

    interface UserLastMessage {
        list: any[]
        count: number
    }

    interface UserLast {
        total_recharge: string
        total_withdraw: string
        total_bonus: string
        total_rebate: string
        list: List[]
        count: number
    }

    interface List {
        trade_no: string
        money: string
        remark: string
        type: number
        symbol: number
        status: number
        time: Date
    }
}
