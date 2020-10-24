type
  XORSHIFT32 = ref object of RootObj
    a: uint32

  XORSHIFT64 = ref object of RootObj
    a: uint64

  XORSHIFT64S = ref object of RootObj
    a: uint64

proc next*(state: XORSHIFT32): uint32 =
  var x = state.a

  x = x xor (x shl 13)
  x = x xor (x shr 17)
  x = x xor (x shl 5)

  state.a = x

  return x

proc next*(state: XORSHIFT64): uint64 =
  var x = state.a

  x = x xor (x shl 13)
  x = x xor (x shr 7)
  x = x xor (x shl 17)

  state.a = x

  return x

proc next*(state: XORSHIFT64S): uint64 =
  var x = state.a

  x = x xor (x shr 12)
  x = x xor (x shl 25)
  x = x xor (x shr 27)

  state.a = x

  return x * 0x2545F4914F6CDD1D'u64

proc seed*(state: XORSHIFT32, seed: uint32) =
  state.a = seed

proc seed*(state: XORSHIFT64, seed: uint64) =
  state.a = seed

proc seed*(state: XORSHIFT64S, seed: uint64) =
  state.a = seed

proc newXorShift32*(seed: uint32 = 1): XORSHIFT32 =
  XORSHIFT32(a: seed)

proc newXorShift64*(seed: uint64 = 1): XORSHIFT64 =
  XORSHIFT64(a: seed)

proc newXorShift64s*(seed: uint64 = 1): XORSHIFT64S =
  XORSHIFT64S(a: seed)
