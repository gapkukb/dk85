import { appRoutes, type AppRoutes } from "@/constants/appRoutes";
import { backToApp } from "@/utils/backToApp";
import { platfrom } from "@/utils/platform";
import { useRouter } from "vue-router";

export type PlatformRoute = { webview?: AppRoutes; web?: string };

export function useBack(targets?: PlatformRoute | string, replacement = false) {
  const router = useRouter();

  const route: PlatformRoute = targets
    ? typeof targets === "string"
      ? { web: targets }
      : targets
    : {};

  return function handle() {
    if (platfrom.app) {
      return backToApp(route.webview || appRoutes.back);
    }

    if (route.web) {
      replacement ? router.replace(route.web) : router.push(route.web);
    } else if (window.history.state.back) {
      router.back();
    } else if (replacement) {
      router.replace("/");
    } else {
      router.push("/");
    }
  };
}
