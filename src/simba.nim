proc randbits*(n: int): int =
  1


proc randbit*(): int =
  randbits(1)


proc randbytes*(n: int): int =
  randbits(n * 8)


proc randbyte*(): int =
  randbytes(1)
