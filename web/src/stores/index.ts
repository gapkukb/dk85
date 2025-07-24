import { createPinia } from "pinia";
import piniaPluginPersistedstate from "pinia-plugin-persistedstate";
import type { App } from "vue";

export default function stores(app: App) {
  const pinia = createPinia();
  pinia.use(piniaPluginPersistedstate);

  Object.defineProperty(app.config.globalProperties, "$store", {
    get() {
      return app.config.globalProperties.$pinia.state.value;
    },
  });

  app.use(pinia);
}
