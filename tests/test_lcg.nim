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


suite "simba/lcg/VB6":
  test "sequence example":
    let
      prng = newVB6()
      vals = @[next(prng), next(prng), next(prng), next(prng), next(prng)]
    assert vals == @[12640960'u32, 8124035'u32, 4294458'u32, 3961109'u32, 14212996'u32]


suite "simba/lcg/Java":
  test "sequence example":
    let
      prng = newJava()
      vals = @[next(prng), next(prng), next(prng), next(prng), next(prng)]
    echo($vals)
    assert vals == @[1015568748'u64, 1586005467'u64, 2165703038'u64, 3027450565'u64, 217083232'u64]


suite "simba/lcg/CarbonLib":
  test "sequence example":
    let
      prng = newCarbonLib()
      vals = @[next(prng), next(prng), next(prng), next(prng), next(prng)]
    assert vals == @[16807'u32, 282475249'u32, 1622647863'u32, 947787490'u32, 1578127215'u32]


suite "simba/lcg/CPP11":
  test "sequence example":
    let
      prng = newCPP11()
      vals = @[next(prng), next(prng), next(prng), next(prng), next(prng)]
    assert vals == @[48271'u32, 182605794'u32, 1291390782'u32, 1716587427'u32, 735130638'u32]


suite "simba/lcg/MMIX":
  test "sequence example":
    let
      prng = newMMIX()
      vals = @[next(prng), next(prng), next(prng), next(prng), next(prng)]
    assert vals == @[7806831264735756412'u64, 9396908728118811419'u64, 11960119808228829710'u64, 7062582979898595269'u64, 14673421054488193520'u64]


suite "simba/lcg/Musl":
  test "sequence example":
    let
      prng = newMusl()
      vals = @[next(prng), next(prng), next(prng), next(prng), next(prng)]
    echo($vals)
    assert vals == @[1015568748'u64, 1586005467'u64, 2165703038'u64, 3027450565'u64, 217083232'u64]
