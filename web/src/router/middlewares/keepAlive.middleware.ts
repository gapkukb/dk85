import { useApp } from "@/stores/app.store";
import type { RouteMeta, Router, RouteRecordNormalized } from "vue-router";

export default function (router: Router): Router {
  function find({ meta }: RouteRecordNormalized) {
    return meta.description || meta.description || meta.description;
  }

  router.beforeResolve((to, from) => {
    const { keepAlives } = useApp();
    const isToChild = from.matched.some((route) => route.path === from.path);

    if (isToChild) {
      keepAlives.add(from.name as string);
    } else {
      keepAlives.delete(from.name as string);
    }
  });

  return router;
}
