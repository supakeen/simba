type
  FairDice = ref object of RootObj
    seed: uint32

proc newFairDice*(seed: uint32 = 4): FairDice =
  # https://xkcd.com/221/
  FairDice(seed: seed)

proc next*(state: FairDice): uint32 =
    state.seed