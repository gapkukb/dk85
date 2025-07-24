import Provider from "./Provider";
import MemoryStorage from "./Memory";

export { type StorageKeys, default as storageKeys } from "./keys";

function supportsLocalStorage() {
  try {
    const testKey = "__test__";
    sessionStorage.setItem(testKey, "test");
    sessionStorage.removeItem(testKey);
    return true;
  } catch (e) {
    return false;
  }
}

const supported = supportsLocalStorage();

const ls = new Provider(supported ? window.localStorage : new MemoryStorage());

const ss = new Provider(supported ? window.sessionStorage : ls.storage);

export { ls, ss };
