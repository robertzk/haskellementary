-- http://research.microsoft.com/en-us/um/people/simonpj/papers/pattern-matching/gadtpm-acm.pdf

zip' :: [a] -> [b] -> [(a, b)]
zip' [] [] = []
zip' (a:as) (b:bs) = (a, b) : zip' as bs


