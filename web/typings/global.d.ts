type EnumLike<T> = T[keyof T]
type EnumPick<T, K extends keyof T> = T[K]


// 联合类型转交叉类型
type UnionToIntersection<U> = 
  (U extends any ? (x: U) => any : never) extends 
  (x: infer I) => any ? I : never;

// 联合类型转元组
type UnionToTuple<T> = UnionToIntersection<
  T extends any ? () => T : never
> extends () => infer R ? [...UnionToTuple<Exclude<T, R>>, R] : [];
