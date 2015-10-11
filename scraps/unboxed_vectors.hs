-- https://hackage.haskell.org/package/vector-0.11.0.0/docs/Data-Vector-Unboxed.html
import Prelude (($), (*), print)
import Data.Vector.Unboxed (toList, take, generate)

main = do 
  let x = generate 100 (2 *)
  print $ toList $ take 2 x

