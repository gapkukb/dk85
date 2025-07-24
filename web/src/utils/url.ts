/**
 * 最初的访问地址,用户第一次进入页面的url
 */
export const initialUrl = new URL(window.location.href);
export const initialUrlParams = initialUrl.searchParams;

export function encode(url: string, depth = 1) {
  while (depth-- > 0) {
    url = encodeURIComponent(url);
  }
  return url;
}

export function decode(url: string) {
  const decoded = decodeURIComponent(url);
  if (url == decoded) return url;
  return decode(decoded);
}
