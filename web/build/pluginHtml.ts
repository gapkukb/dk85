import { createHtmlPlugin } from "vite-plugin-html";
import { dependencies } from "../package.json";

type K = keyof typeof dependencies;

export default createHtmlPlugin({
  minify: false,
  /**
   * 在这里写entry后，你将不需要在`index.html`内添加 script 标签，原有标签需要删除
   * @default src/main.ts
   */
  entry: "src/main.ts",
  /**
   * 如果你想将 `index.html`存放在指定文件夹，可以修改它，否则不需要配置
   * @default index.html
   */
  template: "index.html",

  /**
   * 需要注入 index.html ejs 模版的数据
   */
  inject: {
    data: {
      title: "index",
      injectScript: [
        combine(
          parse("vue", "/dist/vue.runtime.global.prod.min.js"),
          parse("vue-router", "/dist/vue-router.global.prod.min.js"),
          parse("pinia", "/dist/pinia.iife.prod.min.js"),
          parse("axios", "/dist/axios.min.js"),
          parse("dayjs", "/dayjs.min.js"),
          parse("mitt", "/dist/mitt.umd.min.js"),
          parse("iconify-icon", "/dist/iconify-icon.min.js")
        ),
      ].join(""),
    },
    ejsOptions: {
      title: "阿西吧呀",
    },
  },
});

function single(pkg: K, filename: string, esm = false) {
  const type = esm ? "module" : "text/javascript";

  return `<script crossorigin type="${type}" src="//cdn.jsdelivr.net/${parse(
    pkg,
    filename
  )}"></script>`;
}

function parse(pkg: K, filename: string) {
  const v = dependencies[pkg].slice(1);

  return `npm/${pkg}@${v}${filename}`;
}

function combine(...pkgs: string[]) {
  return `<script crossorigin type="text/javascript" src="https://cdn.jsdelivr.net/combine/${pkgs.join(
    ","
  )}"></script>`;
}
