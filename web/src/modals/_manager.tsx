import autobind from '@/helper/autobind'
import useModal from './_helper'

// class Modal {
//     view!: Component
//     ctrl!: WritableComputedRef<boolean>
//     constructor({
//         loader,
//         priority,
//         name,
//         ...props
//     }: {
//         loader: AsyncComponentLoader<Component>
//         name: string
//         priority?: number
//         parallel?: boolean
//         initial?: boolean
//     }) {
//         this.ctrl = useModal(name, priority, props)
//         const View = defineAsyncComponent(loader) as DefineComponent<Component>

//         this.view = () => (
//             <Popup
//                 destroyOnClose={true}
//                 show={this.ctrl.value}
//                 onUpdate:show={(v) => (this.ctrl.value = v)}
//             >
//                 <View />
//             </Popup>
//         )
//     }
//     show() {
//         this.ctrl.value = true
//     }
//     hide() {
//         this.ctrl.value = false
//     }
//     toggle(show: boolean = !this.ctrl.value) {
//         this.ctrl.value = show
//     }
// }

// export default {
//     initialDepositBonus: new Modal({
//         loader: () => import('@/views/initial-deposit-bonus/index.vue'),
//         name: 'initial-deposit-bonus',
//     }),
//     newbieGuide: new Modal({
//         loader: () => import('@/views/newbie-guide/index.vue'),
//         name: 'new-player-guide',
//     }),
//     playTrial: new Modal({
//         loader: () => import('@/views/play-trial/index.vue'),
//         name: 'new-player-guide',
//     }),
//     completeProfile: new Modal({
//         loader: () => import('@/views/complete-profile/index.vue'),
//         name: 'complete-profile',
//     }),
// } as const

//@ts-ignore
@autobind
class ModalCtrl {
    #ctrl!: ReturnType<typeof useModal>
    constructor(name: string) {
        this.#ctrl = useModal(name)
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
