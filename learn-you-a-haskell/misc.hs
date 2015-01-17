{- A collection of miscellaneous Haskell snippets. -}

-- Compute all right triangles with sides length <= 10 and perimeter 24.
let twentyFours = [ (a, b, c) | c <- [1..10], b <- [1..c], a <- [1..b],
  a^2 + b^2 == c^2, a + b + c == 24 ]
--- Result: [(6,8,10)]

