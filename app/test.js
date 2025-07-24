const path = require("path");
const fs = require("fs");

const content = fs.readFileSync(
  __dirname + "/assets/iconfont/iconfont.css",
  "utf-8"
);
const list = content.match(/iconfont(.*)before[^\}]*/gm);

const str = list?.map((icon) => {
  const name = icon.match(/.*(?=:before)/m)?.[0] ?? "";
  const code = icon.match(/(?:content): "\\(\w+)/m)?.[1] ?? "";

  return `\t\tstatic const IconData ${name.replace('iconfont-','').replaceAll(
    "-",
    "_"
  )} = IconData(0x${code}, fontFamily: _family);\n`;
})?.join('');

const final = `
import 'package:flutter/widgets.dart';
class IconFont{
	static const String _family = 'iconfont';
	IconFont._();
${str}}
`;
console.log(final);

fs.writeFileSync(__dirname + "/lib/iconfont/index.dart", final, {
  encoding: "utf-8",
  flush: true,
});
