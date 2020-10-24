import unittest

import simba/fun
import simba/lcg
import simba/lfsr

suite "simba/fun":
  test "FairDice/4":
    let
      prng = newFairDice()
      vals = @[next(prng), next(prng), next(prng), next(prng), next(prng)]

    assert vals == @[4'u32, 4'u32, 4'u32, 4'u32, 4'u32]


suite "simba/lcg":
  test "RANDU/sequence A096555":
    let
      prng = newRANDU()
      vals = @[next(prng), next(prng), next(prng), next(prng), next(prng)]

    assert vals == @[65539'u32, 393225'u32, 1769499'u32, 7077969'u32, 26542323'u32]

  test "NumericalRecipes/sequence example":
    let
      prng = newNumericalRecipes()
      vals = @[next(prng), next(prng), next(prng), next(prng), next(prng)]
    assert vals == @[1015568748'u32, 1586005467'u32, 2165703038'u32,
        3027450565'u32, 217083232'u32]

  test "VB6/sequence example":
    let
      prng = newVB6()
      vals = @[next(prng), next(prng), next(prng), next(prng), next(prng)]
    assert vals == @[12640960'u32, 8124035'u32, 4294458'u32, 3961109'u32, 14212996'u32]


  test "Java/sequence example":
    let
      prng = newJava()
      vals = @[next(prng), next(prng), next(prng), next(prng), next(prng)]
    assert vals == @[384748'u64, 2002481751'u64, 4237743325'u64, 3008360755'u64, 4165058753'u64]


  test "CarbonLib/sequence example":
    let
      prng = newCarbonLib()
      vals = @[next(prng), next(prng), next(prng), next(prng), next(prng)]
    assert vals == @[16807'u32, 282475249'u32, 1622647863'u32, 947787490'u32, 1578127215'u32]


  test "CPP11/sequence example":
    let
      prng = newCPP11()
      vals = @[next(prng), next(prng), next(prng), next(prng), next(prng)]
    assert vals == @[48271'u32, 182605794'u32, 1291390782'u32, 1716587427'u32, 735130638'u32]


  test "MMIX/sequence example":
    let
      prng = newMMIX()
      vals = @[next(prng), next(prng), next(prng), next(prng), next(prng)]
    assert vals == @[7806831264735756412'u64, 9396908728118811419'u64,
        11960119808228829710'u64, 7062582979898595269'u64, 14673421054488193520'u64]


  test "Musl/sequence example":
    let
      prng = newMusl()
      vals = @[next(prng), next(prng), next(prng), next(prng), next(prng)]
    assert vals == @[1481765933'u64, 2009839609'u64, 734534264'u64,
        410517546'u64, 836499822'u64]


suite "simba/lfsr":
  test "XorShift64s/sequence example":
    let
      prng = newXorShift64s()
      vals = @[next(prng), next(prng), next(prng), next(prng), next(prng)]

    assert vals == @[5180492295206395165'u64, 12380297144915551517'u64, 13389498078930870103'u64, 5599127315341312413'u64, 1036278371763004928'u64]
