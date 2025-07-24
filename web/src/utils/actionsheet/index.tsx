import 'vant/es/action-sheet/style'
import { ActionSheet, type ActionSheetProps, type ActionSheetAction } from 'vant'
import { extend, inBrowser, type ComponentInstance } from 'vant/es/utils'
import { mountComponent, usePopupState } from 'vant/es/utils/mount-component'

interface ActionSheetAction2 extends ActionSheetAction {
    id?: number
}

interface Props extends Partial<Omit<ActionSheetProps, 'show' | 'actions'>> {
    actions: ActionSheetAction2[]
}

let instance: ComponentInstance
const DEFAULT_OPTIONS = {
    closeOnClickAction: true,
    cancelText: t('app.cancel'),
} as Props

let currentOptions = extend({}, DEFAULT_OPTIONS)

function initInstance() {
    const Wrapper = {
        setup() {
            const { state, toggle } = usePopupState()
            return () => (
                <ActionSheet
                    {...state}
                    onUpdate:show={toggle}
                />
            )
        },
    }

    ;({ instance } = mountComponent(Wrapper))
}

export function showActionsheet(options: Props): Promise<ActionSheetAction2> {
    return new Promise((resolve, reject) => {
        if (!instance) {
            initInstance()
        }

        instance.open(
            extend({}, currentOptions, options, {
                onSelect: resolve,
                onCancel: reject,
                onClickOverlay: reject,
            })
        )
    })
}

export function closeActionsheet() {
    if (instance) {
        instance.toggle(false)
    }
}
