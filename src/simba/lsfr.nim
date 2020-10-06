import math

type
  LSFR[T] = ref object of RootObj
    seed: T
    msb: T
    lsb: T

proc next*[T](state: LCG[T]): T =
  return next


proc seed*[T](state: LCG[T], seed: T) =
  state.seed = seed
