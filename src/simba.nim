proc randBits*(n: int): int =
  1

proc randBit*(): int =
  randBits(1)

proc randBytes*(n: int): int =
  randBits(n * 8)

proc randByte*(): int =
  randBytes(1)

proc randPick*(): int =
  1

proc randPicks*(): int =
  1

proc randSort*(): int =
  1

proc randInt*(): int =
  1

proc randIntRange*(a, b: int): int =
  1

proc randFloat*(): float =
  1.0

proc randFloatRange*(a, b: float): float =
  1.0

