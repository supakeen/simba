# simba

**Note**: this project is still in active development and not all implementations
have corresponding testcase and as such have not been proven to be correct,
please hold off on using this until these tests are added and this notice is
removed.

This project provides implementations of pseudorandom number generators in pure
Nim. It can be used to generate the same sequences as other PRNGs provided you
know the parameters they use.

All PRNGs implemented in `simba` are *not* cryptographically secure. If you
don't know if you need a CSPRNG or a PRNG you should opt for the first one and
skip this library.

## PRNGs

`simba` currently implements the following types and specific PRNGs. 

### Linear Congruential Generators

- [x] RANDU
- [x] Numerical Recipes
- [x] Visual Basic 6 and below.
- [x] Java's Math.random
- [x] CarbonLib
- [x] C++11
- [x] Turbo Pascal
- [x] MMIX
- [x] Musl

### Linear Feedback Shift Registers

- [x] xorshift32
- [x] xorshift64
- [ ] xorshift128
- [ ] xorwow
- [x] xorshift64s
- [ ] xorshift1024s
- [ ] xoshiro256ss
- [ ] xoshiro256p
- [ ] splitmix64

### Mersenne

- [ ] MT19337
- [ ] MT19337-64
