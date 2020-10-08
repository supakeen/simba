import math

type
  LFSR[T: uint32 | uint64] = ref object of RootObj
    seed: T


proc next*[T](state: LFSR[T]): T =
  return next


proc seed*[T](state: LFSR[T], seed: T) =
  state.seed = seed
