/**
 * 现代化视口单位转换
 *
 * @param {string} opts Icon set prefix
 * @returns {import("postcss").Plugin} SVG as string, undefined on failure
 */
function plugin(opts = {}) {
    const unit1 = /(\d)[l|s|d]([vh|vw])/g
    const unit2 = /(\d)(vh|vw)/g
    const regexp = /(\d+?\.?\d+)([l|s|d])?(vw|vh)/g
    const reg = /(-?\d+(\.\d+)?)(vw)(max)?/g
    const reg2 = /100[lsd]?vh/g
    // 此处可对插件配置opts进行处理
    return {
        postcssPlugin: 'postcss-test', // 插件名字，以postcss-开头
        OnceExit: (root) => {
            root.walkDecls((decl, index) => {
                if (typeof decl.value === 'string' && reg.test(decl.value)) {
                    decl.value = decl.value.replace(reg, (g, n, v) => {
                        if (decl.value.endsWith('max')) {
                            return `max(${n * 6}px,${n}vw)`
                        }

                        return `min(${n * 6}px,${g})`
                    })

                    // if (regexp.test(decl.value)) {
                    //   let flag = false;
                    //   const value = decl.value.replace(regexp, (rawValue, x, y, z) => {
                    //     let before = y ? x + z : rawValue;
                    //     let after = y ? rawValue : x + "d" + z;

                    //     if (x === "100" && z === "vh") {
                    //       before = `var(--_full-vh)`;
                    //     }
                    //     flag = !!y;
                    //     return y ? before : after;
                    //   });

                    //   if (flag) {
                    //     decl.before(` ${decl.prop}: ${value}`);
                    //   } else {
                    //     decl.after(` ${decl.prop}: ${value} `);
                    //     decl.remove();
                    //   }
                    // }
                }

                if (typeof decl.value === 'string' && reg2.test(decl.value)) {
                    decl.value = `var(--wih)`
                }
            })
        },
    }
}

plugin.postcss = true
export default plugin
