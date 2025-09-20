const path = require("path");
const fs = require("fs");
const output = path.join(__dirname, "_gutter.dart");

write();
function task(name, tempalte, alias) {
  return {
    name,
    func() {
      return `\tstatic const ${alias ?? name}_${4 * 1} =  ${tempalte(4 * 1)};
  static const ${alias ?? name}_${4 * 2} =  ${tempalte(4 * 2)};
  static const ${alias ?? name}_${4 * 3} =  ${tempalte(4 * 3)};
  static const ${alias ?? name}_${4 * 4} =  ${tempalte(4 * 4)};
  static const ${alias ?? name}_${4 * 5} =  ${tempalte(4 * 5)};
  static const ${alias ?? name}_${4 * 6} =  ${tempalte(4 * 6)};
  static const ${alias ?? name}_${4 * 7} =  ${tempalte(4 * 7)};
  static const ${alias ?? name}_${4 * 8} =  ${tempalte(4 * 8)};
  static const ${alias ?? name}_${4 * 9} =  ${tempalte(4 * 9)};
  static  const ${alias ?? name}_${4 * 10}  = ${tempalte(4 * 10)};
  `;
    },
  };
}

async function write(content) {
  const tasks = [
    task("all", (value) => `EdgeInsets.all(${value})`),
    task(
      "horizontal",
      (value) => `EdgeInsets.symmetric(horizontal: ${value})`,
      "x"
    ),
    task(
      "vertical",
      (value) => `EdgeInsets.symmetric(vertical: ${value})`,
      "y"
    ),
    task("left", (value) => `EdgeInsets.only(left: ${value})`),
    task("right", (value) => `EdgeInsets.only(right: ${value})`),
    task("top", (value) => `EdgeInsets.only(top: ${value})`),
    task("bottom", (value) => `EdgeInsets.only(bottom: ${value})`),
    task(
      "leftless",
      (value) => `EdgeInsets.fromLTRB(0, ${value}, ${value}, ${value})`
    ),
    task(
      "rightless",
      (value) => `EdgeInsets.fromLTRB(${value}, ${value}, 0, ${value})`
    ),
    task(
      "topless",
      (value) => `EdgeInsets.fromLTRB(${value}, 0, ${value}, ${value})`
    ),
    task(
      "bottomless",
      (value) => `EdgeInsets.fromLTRB(${value}, ${value}, ${value}, 0)`
    ),
  ];
  let c = `import 'package:flutter/material.dart';\n\n`;
  c += `abstract class AppGap {\n`;
  c += tasks.map((i) => i.func()).join("\n");
  c += "}";

  fs.writeFileSync(output, c, {
    encoding: "utf-8",
    flush: true,
  });
}
