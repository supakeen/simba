proc randBits*(n: int): int =
  ## Provide `n` random bits packed into an integer.
  1

proc randBit*(): int =
  ## Provide 1 random bit packed into an integer.
  randBits(1)

proc randBytes*(n: int): int =
  ## Provide `n` random bytes packed into an integer.
  randBits(n * 8)

proc randByte*(): int =
  ## Provide 1 random byte packed into an integer.
  randBytes(1)

proc randPick*(): int =
  ## Pick a random element from a sequence.
  1

proc randPicks*(): int =
  ## Pick `n` random elements from a sequence.
  1

proc randSort*(): int =
  ## Randomly sort a sequence.
  1

proc randInt*(): int =
  ## Provide a random integer.
  1

proc randIntRange*(a, b: int): int =
  ## Provide a random integer between `a` and `b`.
  1

proc randFloat*(): float =
  ## Provide a random float.
  1.0

proc randFloatRange*(a, b: float): float =
  ## Provide a random float between `a` and `b`.
  1.0

