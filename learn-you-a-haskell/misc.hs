{-# LANGUAGE FlexibleInstances #-}
{- A collection of miscellaneous Haskell snippets. -}

-- Compute all right triangles with sides length <= 10 and perimeter 24.
twentyFours = [ (a, b, c) | c <- [1..10], b <- [1..c], a <- [1..b],
  a^2 + b^2 == c^2, a + b + c == 24 ]
--- Result: [(6,8,10)]

-- Combine a bunch of strings

{-
newtype Wrapper = Wrapper { unWrapper :: [Char] }
class Swoopable a where
  swoop :: a -> Wrapper

instance Swoopable Wrapper where
  swoop x = x
-}

class Swoopable a where
  swoop :: a -> [Char]

instance Swoopable [Char] where
  swoop x = x
-- *Main Data.Typeable> swoop "ABC"
-- "ABC"

instance Swoopable [[Char]] where
  swoop x = if length x == 1 then head x else (head x) ++ swoop (tail x)
-- *Main Data.Typeable> swoop ["ABC", "DEF", "GHI"]
-- "ABCDEFGHI"

instance Swoopable [[[Char]]] where
  swoop x = if length x == 1 then swoop (head x) else (swoop (head x)) ++ swoop (tail x)
-- *Main Data.Typeable> swoop [["ABC"], ["DEF", "GHI"]]
-- "ABCDEFGHI"



{-
toWrapper :: Wrapper -> String
toWrapper x = x

class Swoopable a where
  swoop :: a -> Wrapper

instance Swoopable Wrapper where
  swoop = id

class Element a where
   listToFoo :: [a] -> Foo

instance Element Char where
   listToFoo = FooString

instance Element a => String [a] where
   toFoo = listToFoo
-}

--instance Swoopable [[Char]] where
--  swoop x = (head x) ++ swoop (tail x)

-- let swoop x = if length x == 1 then head x else (head x) ++ swoop (tail x)
--swoop ["abc", "cde", "omfg"]
-- "abccdeomfg"

-- A re-implementation of take
take' :: (Ord a, Num a) => a -> [b] -> [b]
take' n _
   | n <= 0 = []
take' _ []   = []
take' n (x:xs) =  x:take' (n-1) xs

-- A re-implementation of reverse
reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = (reverse' xs) ++ [x]

fn :: (Num a) => a -> a
fn = (+1)

flip' :: (a -> b -> c) -> (b -> a -> c)
flip' fn x y = fn y x

collatz :: Integer -> Integer -> [Integer]
collatz n x
  | n <= 0 = []
  | n == 1 && odd x = [3 * x + 1]
  | n == 1 && even x = [x `div` 2]
  | otherwise = [next] ++ (collatz (n-1) next)
  where next = head (collatz 1 x)

chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain x
 | odd x  = x : chain (3 * x + 1)
 | even x = x : chain (x `div` 2)

numLongChains :: Int  
numLongChains = length (filter isLong (map chain [1..100]))  
  where isLong xs = length xs > 15  

invoke :: a -> (a -> a) -> a
invoke x f = f x
-- *Main> take 5 (map (invoke 3) (map (*) [1..]))
-- [3,6,9,12,15]

sumit :: Integer
sumit = foldl (\x y -> x + 2*y) 0 [1..5]

-- Folds are just a dumb name for Reduce
let reduce x y z = foldl x z y
