{-# LANGUAGE DataKinds #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE TypeFamilies #-}

data Nat = Zero | Succ Nat deriving (Eq, Show)

data Vect :: Nat -> * -> * where
  VN :: Vect Zero a
  VC :: a -> Vect n a -> Vect (Succ n) a

-- The following definition of zip is not complete! It does not cover the 
-- case where the two arguments have different lengths.
zip' :: [a] -> [b] -> [(a, b)]
zip' [] [] = []
zip' (a:as) (b:bs) = (a, b) : zip' as bs

-- On the other hand, using Vect n will guarantee a compiler check of
-- the vector lengths.
vzip :: Vect n a -> Vect n b -> Vect n (a, b)
vzip VN VN = VN
vzip (VC x xs) (VC y ys) = VC (x, y) (vzip xs ys)

-- For example...
out :: Vect (Succ (Succ Zero)) (Int, Int)
out = vzip x y where
  x = VC (1 :: Int) $ VC (1 :: Int) $ (VN :: Vect Zero Int)
  y = VC (3 :: Int) $ VC (4 :: Int) $ (VN :: Vect Zero Int)



