import type { RouteMeta, Router, RouteRecordNormalized } from "vue-router";

/**
 * update html title description keywords
 */
export default function (router: Router): Router {
  router.beforeEach((to, from) => {
    if (from.query.aaa) {
      to.query.aaa = from.query.aaa;
    }

    return to;
  });

  return router;
}
