export default function openUrl(url: string, name: string) {
    const newWindow = window.open('', name)

    if (newWindow) {
        setTimeout(() => {
            newWindow!.location.href = url
        }, 0)
    } else {
        console.log('Popup window blocked or failed to open.')
    }
}
