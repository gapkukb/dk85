import { ModalsView, Modals } from '.'

export default function () {
    return ModalsView.map((modal) => {
        if (Modals.names.value.has(modal.name))
            return h(modal.component, {
                name: modal.name,
                onClosed() {
                    Modals.close(modal.name)
                },
            })
        return null
    })
}
