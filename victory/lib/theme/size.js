const path = require("path");
const fs = require("fs");
const output = path.join(__dirname, "gutter.dart");

write();

async function write(content) {
  let c = `import 'package:flutter/material.dart';\n\n`;
  c += `abstract class AppSize {\n`;

  c += size();
  c += "\n";
  c += borderRadius();
  c += "\n";
  c += "\tstatic const zero = EdgeInsets.zero;\n\n";
  c += edgeInsets();
  c += "}";

  fs.writeFileSync(output, c, {
    encoding: "utf-8",
    flush: true,
  });
}

function facotry(template) {
  return (
    "\t" +
    Array.from({ length: 15 })
      .map((_, i) => (i + 1) * 4)
      .map(template)
      .join("\t")
  );
}

function radius() {
  return facotry(
    (value) =>
      `static const radius_all_${value} = const BorderRadius.all(Radius.circular(${value}.0));\n`
  );
}

function size() {
  return facotry((value) => `static const size_${value} = ${value}.0;\n`);
}

function edgeInsets() {
  function task(name, tempalte) {
    return facotry(
      (value) =>
        `static const ${name}_${value} = const ${tempalte(value + ".0")};\n`
    );
  }

  const tasks = [
    task("pad_a", (value) => `EdgeInsets.all(${value})`),
    task("pad_x", (value) => `EdgeInsets.symmetric(horizontal: ${value})`),
    task("pad_y", (value) => `EdgeInsets.symmetric(vertical: ${value})`),
    task("pad_l", (value) => `EdgeInsets.only(left: ${value})`),
    task("pad_r", (value) => `EdgeInsets.only(right: ${value})`),
    task("pad_t", (value) => `EdgeInsets.only(top: ${value})`),
    task("pad_b", (value) => `EdgeInsets.only(bottom: ${value})`),
    task(
      "pad_not_l",
      (value) => `EdgeInsets.fromLTRB(0, ${value}, ${value}, ${value})`
    ),
    task(
      "pad_not_r",
      (value) => `EdgeInsets.fromLTRB(${value}, ${value}, 0, ${value})`
    ),
    task(
      "pad_not_t",
      (value) => `EdgeInsets.fromLTRB(${value}, 0, ${value}, ${value})`
    ),
    task(
      "pad_not_b",
      (value) => `EdgeInsets.fromLTRB(${value}, ${value}, ${value}, 0)`
    ),
  ];

  return tasks.join("\n");
}

function borderRadius() {
  function task(name, tempalte) {
    return facotry((value) => {
      const s = tempalte(`Radius.circular(${value})`);
      return `/// ${s} \n\tstatic const ${name}_${value} = const ${s};\n\n`;
    });
  }

  const tasks = [
    task("radius_a", (value) => `BorderRadius.all(${value})`),
    task(
      "radius_x",
      (value) => `BorderRadius.horizontal(left:${value},right:${value})`
    ),
    task(
      "radius_y",
      (value) => `BorderRadius.vertical(top:${value},bottom:${value})`
    ),
    task("radius_l", (value) => `BorderRadius.only(topLeft: ${value})`),
    task("radius_r", (value) => `BorderRadius.only(topRight: ${value})`),
    task("radius_t", (value) => `BorderRadius.only(bottomLeft: ${value})`),
    task("radius_b", (value) => `BorderRadius.only(bottomRight: ${value})`),
  ];

  return tasks.join("\n");
}
