export default class Memory implements Storage {
  [name: string]: any;

  store: Map<string, any> = new Map();

  get length() {
    return this.store.size;
  }
  clear(): void {
    this.store = new Map();
  }
  getItem(key: string): string | null {
    return this.store.get(key);
  }
  key(index: number): string | null {
    return Array.from(this.store.keys())[index];
  }
  removeItem(key: string): void {
    this.store.delete(key);
  }
  setItem(key: string, value: string): void {
    this.store.set(key, value);
  }
}
