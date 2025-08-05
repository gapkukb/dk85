import useModal from './_helper'

class ModalCtrl {
    #ctrl!: ReturnType<typeof useModal>
    constructor(name: string) {
        this.#ctrl = useModal(name)
        this.open = this.open.bind(this)
        this.close = this.close.bind(this)
        this.toggle = this.toggle.bind(this)
    }

    get value() {
        return this.#ctrl.value
    }

    set value(v: boolean) {
        this.#ctrl.value = v
    }

    open() {
        this.value = true
    }

    close() {
        this.value = false
    }

    toggle(show: boolean) {
        this.value = show ?? !this.value
    }
}

export default {
    /** 登录注册 */
    authentication: new ModalCtrl('authentication'),
    /** 首充优惠 */
    initialTopupBonus: new ModalCtrl('initial-deposit-bonus'),
    /** 新手引导 */
    newbieGuide: new ModalCtrl('newbie-guide'),
    /** 游戏试玩 */
    playTrial: new ModalCtrl('play-trial'),
    /** 完善资料-手机号-邮箱 */
    completeProfile: new ModalCtrl('complete-profile'),
}
