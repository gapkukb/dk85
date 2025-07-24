export const platfrom = (function () {
  const url = new URL(globalThis.location.href);
  const from = url.searchParams.get("isFrom");
  const glife = isGlife(url.host, from);
  const lazada = glife ? false : isLazada(url.host, from);
  const maya = glife || lazada ? false : isMaya(url.host, from);
  const miniApp = glife || lazada || maya;
  const app = miniApp
    ? false
    : globalThis.inApp || !!url.searchParams.get("os");

  const android = navigator.userAgent.toLowerCase().indexOf("android") > -1;
  const ios = android ? false : isIos();

  return {
    glife,
    lazada,
    maya,
    miniApp,
    app,
    ios,
    android,
    web: miniApp || app ? false : true,
  };
})();

function isGlife(host: string, from: string | null) {
  return ["glife", "glifearena"].includes(host) || from === "Glife";
}

function isLazada(host: string, from: string | null) {
  return ["lazada", "lazadaarena"].includes(host) || from === "Lazada";
}

function isMaya(host: string, from: string | null) {
  return ["maya", "mayalaroplus"].includes(host) || from === "Maya";
}

function isIos() {
  return (
    [
      "iPad Simulator",
      "iPhone Simulator",
      "iPod Simulator",
      "iPad",
      "iPhone",
      "iPod",
    ].includes(navigator.platform) ||
    // iPad on iOS 13 detection
    (navigator.userAgent.includes("Mac") && "ontouchend" in document)
  );
}
