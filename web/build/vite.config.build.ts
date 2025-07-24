import { defineConfig } from "vite";
import pkg from "../package.json";
import pluginHtml from "./pluginHtml";

type External = keyof typeof pkg.dependencies;

export default defineConfig({
  plugins: [pluginHtml],
  build: {
    rollupOptions: {
      external: ["vue"] as External[],
      output: {
        format: "iife",
        globals: {
          vue: "Vue",
          "vue-router": "VueRouter",
          axios: "axios",
        },
        advancedChunks: {
          groups: [
            // { name: "axios", test: /axios/ },
            // { name: "vue", test: /node_modules\/@?vue/ },
          ],
        },
      },
    },
  },
  experimental: {
    enableNativePlugin: true,
  },
});
