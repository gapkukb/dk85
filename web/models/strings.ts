/** 字符串或者数字 */
type Numberish = number | string;

/** 字符串数字或者数字 */
type NumberLike = number | `${number}`;

type Dict<T> = Record<string, T>;

type Maybe<T> = T | void;

type Arrayable<T> = T | Array<T>;

type _Without<X, Y> = { [P in Exclude<keyof X, keyof Y>]?: never };

type XOR<X, Y> = (X & _Without<Y, X>) | (Y & _Without<X, Y>);

type Literalizable<T extends string = string> = (string & {}) | T;

type Constructor = new (...args: any[]) => void;

type IsClass<T> = T extends Constructor ? true : false;

type ClassProperties<C> = {
  [Key in keyof C as C[Key] extends Function ? never : Key]: C[Key];
};

type Concat<X extends any[], Y extends any[]> = [...X, ...Y];

type TupleToUnion<T> = T extends any[] ? T[number] : T;

type Pop<T extends any[]> = T extends [...infer R, infer L] ? R : never;

type AppendArgument<Fn extends (...s: any[]) => any, A> = Fn extends (
  ...s: infer T
) => infer R
  ? (...s: [...T, A]) => R
  : never;
