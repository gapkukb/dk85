import Template from './Loading.vue'

const frament = document.createDocumentFragment()
document.body.appendChild(frament)

const app = createApp(Template, {
    className: 'global-loading',
    teleport: 'body',
})

const vm = app.mount(frament as any) as InstanceType<typeof Template>

class _Loading {
    open() {
        vm.toggle(true)
    }
    close() {
        vm.toggle(false)
    }
}

const loading = new _Loading()

export default loading

export const Loading = Template
