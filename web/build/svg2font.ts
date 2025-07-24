import path from "path";
import fs from "fs-extra";
import fg from "fast-glob";
import svgtofont from "svgtofont";

import type { Plugin } from "vite";

export default function svgToFontPlugin(options: any = {}) {
  const {
    svgDir = "src/icons", // 真实模块路径
    virtualSvgs = {}, // 虚拟模块 SVG 内容
    fontName = "iconfont",
    output = "dist/fonts",
  } = options;
  const exts = ["svg", "png", "jpg"];
  return {
    name: "vite-plugin-svg-to-font",
    enforce: "post",

    // async buildStart() {
    //   const tempSvgDir = path.resolve(".temp-svg-icons");
    //   await fs.ensureDir(tempSvgDir);

    //   // 1. 复制真实模块 SVG 文件
    //   const svgFiles = await fg("**/*.svg", { cwd: svgDir, absolute: true });
    //   for (const file of svgFiles) {
    //     const fileName = path.basename(file);
    //     await fs.copyFile(file, path.join(tempSvgDir, fileName));
    //   }

    //   // 2. 写入虚拟模块 SVG 内容
    //   for (const [name, content] of Object.entries(
    //     virtualSvgs as Record<string, string>
    //   )) {
    //     await fs.writeFile(path.join(tempSvgDir, `${name}.svg`), content);
    //   }

    //   // 3. 生成字体文件
    //   await svgtofont({
    //     src: tempSvgDir,
    //     dist: path.resolve(output),
    //     fontName,
    //     typescript: false,
    //     excludeFormat: ["eot", "svg", "symbol.svg", "ttf", "woff"],
    //     css: true, // Create CSS files.
    //     svgicons2svgfont: {
    //       fontHeight: 1000,
    //       normalize: true,
    //     },
    //     // website = null, no demo html files
    //     website: {
    //       links: [],
    //     },
    //   });

    //   // 4. 清理临时目录
    //   await fs.remove(tempSvgDir);
    // },

    transform(code, id, options) {
      if (code.includes("?sprite")) {
        console.log(code);
        
      }
      // const [ext, params = ""] = path.basename(id).split("?");
      //   const images = code.match(/<img.*?src="(.*?)"/gim)
      //   if(!images) return;
      //   console.log(images);
    },


    // load(id, options) {
    //   console.log(id);
      
    // },

  } as Plugin;
}
