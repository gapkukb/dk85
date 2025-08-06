<script setup lang="ts">
import { driver } from 'driver.js'
import 'driver.js/dist/driver.css'
const emit = defineEmits<{ closed: [] }>()
const driverObj = driver({
    disableActiveInteraction: true,
    overlayClickBehavior: 'nextStep',
    stagePadding: 0,
    showButtons: ['next'],
    onDestroyed: () => emit('closed'),
    onPopoverRender(popover, opts) {
        console.log(opts.state.activeIndex)
        const img = new Image()
        img.src = '/logo.webp'
        popover.nextButton.id = 'guide-next-button'
        popover.wrapper.prepend(img)
    },
    steps: [
        {
            element: '#guide-1',

            popover: {
                side: 'over',
                nextBtnText: '好的，我知道了',
            },
        },
        {
            element: '#guide-3',
            popover: {
                side: 'over',
                nextBtnText: '好的，我知道了',
            },
        },
    ],
})

driverObj.drive()
</script>

<template>
    <div></div>
</template>

<style lang="scss">
#guide-next-button {
    text-shadow: none;
    background: #ff5800 !important;
    color: white;
    padding: 8px 16px;
    // border-radius: 100px;
    border: 0;
}
</style>
