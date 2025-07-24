import { ref } from 'vue'
import { ModalsName } from '.'
import mitt from '@/utils/mitt'
import { useUser } from '@/stores/user.store'

const bus = mitt<{ close: any }>()

export abstract class Modals {
    static names = ref(new Set<ModalsName>([]))

    static open(name: ModalsName, params?: { redirect?: string; closeAll?: boolean; [key: string | number]: any }) {
        const { authenticated } = useUser()
        if (name === ModalsName.login && authenticated) return Promise.reject(`已经登录了`)
        this.names.value.add(name)
        return new Promise((resolve) => {
            bus.once('close', resolve)
        })
    }

    static close(name: ModalsName) {
        this.names.value.delete(name)
        bus.emit('close')
    }
    static closeAll() {
        this.names.value.clear()
        bus.emit('close')
    }
}
