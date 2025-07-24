export const appRoutes = {
  back: "Bingo://Back",
} as const;

export type AppRoutes = EnumLike<typeof appRoutes>;
