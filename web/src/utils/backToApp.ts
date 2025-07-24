import { appRoutes, type AppRoutes } from "@/constants/appRoutes";

export function backToApp(route: AppRoutes = appRoutes.back) {
  //   const a = document.createElement("a");
  //   a.href = route;
  //   a.click();
  window.open(route, "_self");
}
