import unittest

import simba/lfsr

suite "simba/lfsr/XorShift64s":
  test "sequence example":
    let
      prng = newXorShift64s()
      vals = @[next(prng), next(prng), next(prng), next(prng), next(prng)]

    assert vals == @[5180492295206395165'u64, 12380297144915551517'u64, 13389498078930870103'u64, 5599127315341312413'u64, 1036278371763004928'u64]
