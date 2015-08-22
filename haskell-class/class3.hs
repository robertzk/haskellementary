taxicab :: Integer -> Bool
taxicab n =
  let m = last $
          takeWhile (\x -> x^3 <= n) [1..]
      solns = [(x, y) | x <- [1..m],
                        y <- [1..m],
                        z <- 

