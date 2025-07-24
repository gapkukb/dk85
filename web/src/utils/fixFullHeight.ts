import { throttle } from "xgplayer/es/utils/util";

let dvh: string;

function set() {
  document.documentElement.style.setProperty("--wih", dvh);
}

function listen() {
  dvh = window.innerHeight + "px";
  set();
  window.addEventListener("resize", throttle(listen, 300, {}), { once: true });
}

if (CSS.supports("height", "100dvh")) {
  dvh = "100dvh";
  set();
} else if (CSS.supports("-webkit-touch-callout", "none")) {
  dvh = "-webkit-fill-available";
  set();
} else if (CSS.supports("height", "100vh")) {
  dvh = "100vh";
  set();
  ensure();
} else {
  listen();
}

function ensure() {
  globalThis.requestAnimationFrame(() => {
    const cssHeight = parseInt(
      getComputedStyle(document.documentElement).height
    );
    if (cssHeight !== window.innerHeight) {
      listen();
    }
  });
}
