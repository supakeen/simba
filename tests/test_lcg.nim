import unittest

import simba/lcg

suite "simba/lcg/RANDU":
  test "sequence A096555":
    let
      prng = newRANDU()
      vals = @[next(prng), next(prng), next(prng), next(prng), next(prng)]

    assert vals == @[65539'u32, 393225'u32, 1769499'u32, 7077969'u32, 26542323'u32]

suite "simba/lcg/NumericalRecipes":
  test "sequence example":
    let
      prng = newNumericalRecipes()
      vals = @[next(prng), next(prng), next(prng), next(prng), next(prng)]
    assert vals == @[1015568748'u32, 1586005467'u32, 2165703038'u32, 3027450565'u32, 217083232'u32]