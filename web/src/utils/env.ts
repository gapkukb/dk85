export default parse()


function parse() {
  const ENV = {
    DEV: 0,
    FAT: 1,
    UAT: 2,
    PRE: 3,
    PROD: 4,
  } as const;

  function resolve() {
    const host = window.location.host;
    if (import.meta.env.DEV) {
      return ENV.DEV;
    }

    if (host.endsWith("fat.com")) {
      return ENV.FAT;
    }

    if (host.endsWith(".uatext66ap.com") || host.endsWith(".c66uat.com")) {
      return ENV.UAT;
    }

    if (host.startsWith("grayscale")) {
      return ENV.PRE;
    }

    return ENV.PROD;
  }

  const env = resolve();

  return {
    isDev: env === ENV.DEV,
    isFat: env === ENV.FAT,
    isUat: env === ENV.UAT,
    isPre: env === ENV.PRE,
    isProd: env === ENV.PROD,
    isDebug: env === ENV.PROD || window.location.search.includes("arenadebug"),
  };
}
