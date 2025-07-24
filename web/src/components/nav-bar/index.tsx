import 'vant/es/nav-bar/style'
import { type NavBarProps, NavBar } from 'vant'
import type { SetupContext } from 'vue'
import { useBack } from '@/composables/useBack'
{
    /* <script setup lang="ts">
import { useBack } from '@/composables/useBack';
import { navBarProps } from 'vant';


const props = defineProps(navBarProps)
const back = useBack()
defineSlots<{ right: void, left: void; title: void }>()
</script>

<template>
    <van-nav-bar left-arrow @click-left="back" v-bind="props" v-on="$attrs"></van-nav-bar>
</template> */
}

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
