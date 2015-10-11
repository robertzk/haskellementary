import Prelude (($), (*), print)
-- import Prelude qualified P
import Data.Vector.Unboxed (toList, take, generate)

main = do 
  let x = generate 100 (2 *)
  print $ toList $ take 2 x
