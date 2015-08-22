
data Zero
data One

type RowLength = Int

data RowLength = RLength [Bool] deriving (Show, Ord)

data (RowLength l) => DataFrame l = [Vector l] 



data RowLength = 

data DataFrame = DataFrame RowLength [Vector]

class (RowLength l) => DataFrame l where
  
