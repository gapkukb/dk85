declare namespace model.user {
    interface User {
        activation: boolean
        agentFlag: boolean
        birthday: string
        blackFlag: number
        branchAddress: string
        branchCode: string
        branchName: string
        branchPhone: string
        cashCredit: number
        city: string
        customerId: string
        customerLevel: number
        customerType: number
        firstDepositFlag: boolean
        firstIdStatus: string
        firstName: string
        gameCredit: number
        gender: string
        glife: boolean
        headShot: string
        isLazada: boolean
        lastLoginDate: string
        lastName: string
        loginName: string
        loginNameFlag: number
        loginPwdFlag: boolean
        marginSwitch: boolean
        mayaFlag: boolean
        mobileNo: string
        nationality: string
        newWalletFlag: number
        nickName: string
        oddsType: number
        onlineBet: boolean
        product: number
        registDate: string
        registerMethod: string
        silentPhotoSwitch: boolean
        whiteListUser: boolean
        withdrewPwd: boolean
    }

    namespace vo {
        interface Login {
            token: string
            user: User
        }
    }
}
