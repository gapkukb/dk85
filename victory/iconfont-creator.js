const path = require("path");
const fs = require("fs");
const http = require("http");
const version = "//at.alicdn.com/t/c/font_4981191_fkhzeneoja.css";

download(version);

function download(url) {
  cssToDart(`http:${url}`, "lib/iconfont/iconfont.dart");
  write(`http:${url.replace(".css", ".ttf")}`, "assets/iconfont/iconfont.ttf");
}

async function write(url, name) {
  fs.mkdir(path.dirname(name), { recursive: true }, (err) => {
    if (err) throw err;

    const file = fs.createWriteStream(name, { flags: "w" });
    const request = http.get(url, function (response) {
      response.pipe(file);

      // after download completed close filestream
      file.on("finish", () => {
        file.close();
        console.log("Download Completed");
      });
    });
  });
}

function cssToDart(url, name) {
  http.get(url, (res) => {
    let content = "";

    // Listen for 'data' events to collect the response chunks
    res.on("data", (chunk) => {
      content += chunk;
    });

    // Listen for the 'end' event to know when the response is complete
    res.on("end", () => {
      const list = content.match(/iconfont(.*)before[^\}]*/gm);

      const str = list
        ?.map((icon) => {
          const name = icon.match(/.*(?=:before)/m)?.[0] ?? "";
          const code = icon.match(/(?:content): "\\(\w+)/m)?.[1] ?? "";

          return `\t\tstatic const IconData ${name
            .replace("iconfont-", "")
            .replaceAll(
              "-",
              "_"
            )} = IconData(0x${code}, fontFamily: _family);\n`;
        })
        ?.join("");

      const final = `
import 'package:flutter/widgets.dart';
class IconFont{
	static const String _family = 'iconfont';
	IconFont._();
${str}}
`;

      fs.writeFileSync(name, final, {
        encoding: "utf-8",
        flush: true,
      });
    });
  });
}
