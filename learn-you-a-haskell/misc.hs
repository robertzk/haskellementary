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

