## Linear Congruential Generators are a class of pseudorandom number generators
## which are most often use for their small memory footprint often requiring
## just three numbers to be stored.
## 
## The disadvantages of LCGs are their small memory footpring leading to a
## small state, LCGs feed back the last generated value as their next seed
## value. Due to this they can be predicted by seeing one value, and knowing
## the type of LCG in use.
## 
## This module implements many LCGs, this is because LCGs tend to follow the
## same formula and only change parameters.
## 
## Parameter values for these come from Wikipedia and can be found at
## https://en.wikipedia.org/wiki/Linear_congruential_generator

import math

type
  LCG[T: uint32 | uint64] = ref object of RootObj
    ## State for an LCG with its parameters, `a`, `c`, and `m`. We keep a bit
    ## more space to store which bits should be output if any limits apply.
    a: T
    c: T
    m: T
    seed: T
    msb: T
    lsb: T


proc next*[T](state: LCG[T]): T =
  ## Get the next value for an LCG
  var next: T

  if state.m != 0:
    next = (state.a * state.seed + state.c) mod state.m
  else:
    next = (state.a * state.seed + state.c)

  if state.msb != 0:
    next = next and (T(2) ^ state.msb - T(1))

  if state.lsb != 0:
    next = next shr state.lsb

  state.seed = next

  return next


proc seed*[T](state: LCG[T], seed: T) =
  ## Seed an LCG
  state.seed = seed


proc newRANDU*(seed: uint32 = 1): LCG[uint32] =
  ## IBM's RANDU is widely considered to be one of the most ill-conceived random
  ## number generators ever designed, and was described as "truly horrible" by
  ## Donald Knuth. It fails the spectral test badly for dimensions greater than
  ## 2, and every integer result is odd. However, at least eight low-order bits
  ## are dropped when converted to single-precision (32 bit, 24 bit mantissa)
  ## floating-point.
  LCG[uint32](a: 65539'u32, seed: seed, c: 0, m: 2'u32 ^ 31'u32)

proc newNumericalRecipes*(seed: uint32 = 1): LCG[uint32] =
  ## Numerical Recipes is the generic title of a series of books on algorithms
  ## and numerical analysis by William H. Press, Saul A. Teukolsky,
  ## William T. Vetterling and Brian P. Flannery.
  LCG[uint32](a: 1664525'u32, seed: seed, c: 1013904223'u32, m: 0'u32)

  # Note that Numerical Recipes uses 2^32 as its `m`, this is all zeros for the
  # width it operates on.

proc newVB6*(seed: uint32 = 1): LCG[uint32] =
  ## The LCG used by Microsoft Visual Basic 6 (and earlier)
  LCG[uint32](a: 1140671485'u32, seed: seed, c: 12820163'u32, m: 2'u32 ^ 24'u32)

proc newJava*(seed: uint64 = 1): LCG[uint64] =
  ## As used by Java's `java.util.Random`, POSIX `[ln]rand48`, and glibc's
  ## `[ln]rand48[_r]`.
  LCG[uint64](a: 25214903917'u64, seed: seed, c: 11'u64, m: 2'u64 ^ 48'u64, msb: 48'u64, lsb: 16'u64)

proc newCarbonLib*(seed: uint32 = 1): LCG[uint32] =
  ## LCG in use by Apple CarbonLib and C++11's `minstd_rand0`.
  LCG[uint32](a: 16807'u32, seed: seed, c: 0'u32, m: 2'u32 ^ 31'u32 - 1)

proc newCPP11*(seed: uint32 = 1): LCG[uint32] =
  ## C++'s `minstd_rand`.
  LCG[uint32](a: 48271'u32, seed: seed, c: 0'u32, m: 2'u32 ^ 31'u32 - 1)

proc newTurboPascal*(seed: uint32 = 1): LCG[uint32] =
  ## Turbo Pascal's LCG.
  LCG[uint32](a: 134775813'u32, seed: seed, c: 1'u32, m: 0)

  # Note that Turbo Pascal uses 2 ^ 32 as its `m`, this is all zeros for the
  # width it operates on.

proc newMMIX*(seed: uint64 = 1): LCG[uint64] =
  ## MMIX by Donald Knuth
  LCG[uint64](a: 6364136223846793005'u64, seed: seed, c: 1442695040888963407'u64, m: 0)

  # Note that MMIX uses 2 ^ 64 as its `m`, this is all zeros for the width it
  # operates on.

proc newMusl*(seed: uint64 = 1): LCG[uint64] =
  ## Musl and Newlib's LCG.
  LCG[uint64](a: 6364136223846793005'u64, seed: seed, c: 1'u64, m: 0, msb: 64'u64, lsb: 32'u64)

  # Note that Musl uses 2 ^ 64 as its `m`, this is all zeros for the width it
  # operates on.
