import type { RouteMeta, Router, RouteRecordNormalized } from "vue-router";

/**
 * update html title description keywords
 */
export default function (router: Router): Router {
  const keywords = document.head.querySelector("#keywords") as HTMLMetaElement;
  const description = document.head.querySelector(
    "#description"
  ) as HTMLMetaElement;

  function find({ meta }: RouteRecordNormalized) {
    return meta.description || meta.description || meta.description;
  }

  function update(meta: RouteMeta) {
    document.title = meta.title || document.title;
    keywords.content = meta.keywords || keywords.content;
    description.content = meta.description || description.content;
  }

  router.beforeResolve((to) => {
    const route = to.matched.reverse().find(find);

    route && update(route.meta);
  });

  return router;
}
