import { APP_ROUTES } from '@/constants/app.const'

export function backToApp(route: APP_ROUTES = APP_ROUTES.back) {
    //   const a = document.createElement("a");
    //   a.href = route;
    //   a.click();
    window.open(route, '_self')
}
