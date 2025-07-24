import type { PluginOption } from "vite";
import viteSvgToWebfont from "vite-svg-2-webfont";
import { resolve } from "node:path";

export default function testPlugin() {
  const virtualModuleId = "virtual:svg-to-font2.css";
  const resolvedVirtualModuleId = "\0" + virtualModuleId;

  return {
    enforce: "pre",
    name: "my-plugin",
    apply(config, env) {
      console.log('apply');
      config.plugins?.unshift(
        viteSvgToWebfont({
          context: resolve(process.cwd(), "svg"),
        })
      );
      return true;
    },
    
    // buildStart(options) {
    //   console.log("buildStart");
    // },
    // transform(code, id, options) {
    //   console.log("transform");
    //   if (id.startsWith("~icons")) {
    //     return template();
    //   }
    //   return code;
    // },
    // load(id, options) {
    //   if (id === resolvedVirtualModuleId) {
    //     return;
    //   }
    // },
  } as PluginOption;
}

function template() {
  return `import { markRaw,h } from "vue";

function render() {
  return h('i',{class:'icon icon-12 icon-test'})
}

export default markRaw({ name: 'radix-icons-eye-open', render })
/* vite-plugin-components disabled */
  `;
}
