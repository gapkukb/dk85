import 'vant/es/nav-bar/style'
import { type NavBarProps, NavBar } from 'vant'
import type { SetupContext } from 'vue'
import { useBack } from '@/composables/useBack'


export default function (props: Partial<NavBarProps & { backPath: string }>, ctx: SetupContext) {
    const back = useBack({ web: props.backPath })
    return (
        <div class="h-46">
            <NavBar
                fixed
                left-arrow
                left-text={t('app.back')}
                onClickLeft={back}
                {...props}
                v-slots={ctx.slots}
            />
        </div>
    )
}
