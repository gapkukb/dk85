export default function openUrl(url: string) {
    const newWindow = window.open('about:blank', '_blank')

    if (newWindow) {
        setTimeout(() => {
            newWindow!.location.href = url
        }, 0)
        // Add an event listener to the opened window for the 'beforeunload' event
        newWindow.addEventListener('beforeunload', (event) => {
            console.log('The opened window is closing or navigating away.')
        })
    } else {
        console.log('Popup window blocked or failed to open.')
    }
}
