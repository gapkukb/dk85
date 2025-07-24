// import postcss from ".pnpm/postcss@8.5.6/node_modules/postcss";
const hasImageRegexp = /background[^:]*.*url[^;]+/gi;
function plugin(opts = {}) {
  // 此处可对插件配置opts进行处理
  return {
    postcssPlugin: "postcss-test", // 插件名字，以postcss-开头

    Declaration: {
      "background-image"(decl, postcss) {
        // console.log("decl", postcss.parse(decl.value));
        // 可以进一步获得decl节点指定的属性值，这里是获得属性为color的值
      },

      background(decl, postcss) {
        if(decl.value.includes('data:image')) return;
        console.log('--------------');
        
        console.log("decl", decl.value);
      },
    },
  };
}

plugin.postcss = true;
export default plugin;
