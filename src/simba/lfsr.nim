import math

type
  XORSHIFT64S = ref object of RootObj
    a: uint64


proc next*(state: XORSHIFT64S): uint64 =
  var x = state.a

  x = x xor (x shr 12)
  x = x xor (x shl 25)
  x = x xor (x shr 27)

  state.a = x

  return x * 0x2545F4914F6CDD1D'u64


proc seed*(state: XORSHIFT64S, seed: uint64) =
  state.a = seed


proc newXorShift64s*(seed: uint64 = 1): XORSHIFT64S =
  XORSHIFT64S(a: seed)
