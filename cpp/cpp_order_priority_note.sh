Level  Operator                           Description                                      Grouping
1      ::                                 scope                                            Left-toright
2      () [] . -> ++ --                   dynamic_cast static_cast 
                                          reinterpret_cast const_cast typeid postfix       Left-toright
3      ++ -- ~ ! sizeof new delete        unary (prefix)                                   Right-toleft
       * &                                indirection and reference
                                          (pointers)
       + -                                unary sign operator
4      (type)                             type casting                                     Right-toleft
5      .* ->*                             pointer-to-member                                Left-toright
6      * / %                              multiplicative                                   Left-toright
7      + -                                additive                                         Left-toright
8      << >>                              shift                                            Left-toright
9      < > <= >=                          relational                                       Left-toright
10     == !=                              equality                                         Left-toright
11     &                                  bitwise AND                                      Left-toright
12     ^                                  bitwise XOR                                      Left-toright
13     |                                  bitwise OR                                       Left-toright
14     &&                                 logical AND                                      Left-toright
15     ||                                 logical OR                                       Left-toright
16     ?:                                 conditional                                      Right-toleft
17     = *= /= %= += -= >>= <<= &= ^= |=  assignment                                       Right-toleft
18     ,                                  comma                                            Left-toright
