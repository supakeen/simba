import unittest

import simba/fun

suite "simba/fun/FairDice":
  test "4":
    let
      prng = newFairDice()
      vals = @[next(prng), next(prng), next(prng), next(prng), next(prng)]

    assert vals == @[4'u32, 4'u32, 4'u32, 4'u32, 4'u32]