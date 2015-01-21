{- A collection of type and typeclassing related experiments. -}


lucky :: (Integral a) => a -> String  
lucky 7 = "LUCKY NUMBER SEVEN!"  
lucky x = "Sorry, you're out of luck, pal!"   

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)

head' :: [a] -> a
head' (x:_) = x

max' :: (Ord a) => a -> a -> a  
max' a b   
    | a > b     = a  
    | otherwise = b  

bmiTell :: (RealFloat a) => a -> a -> String  
bmiTell weight height  
    | bmi <= skinny = "You're underweight, you emo, you!"  
    | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"  
    | bmi <= fat    = "You're fat! Lose some weight, fatty!"  
    | otherwise     = "You're a whale, congratulations!"  
    where bmi = weight / height ^ 2  
          skinny = 18.5  
          normal = 25.0  
          fat = 30.0  

calcBmis :: (RealFloat a) => [(a, a)] -> [a]  
calcBmis xs = [ w / h ^ 2 | (w, h) <- xs] 

maximum' :: (Ord a) => [a] -> a
maximum' []    = error "cannot take max of empty list"
maximum' [x]   = x
maximum' (x:y)
  | x > maxTail   = x
  | otherwise     = maxTail
  where maxTail   = maximum' y

