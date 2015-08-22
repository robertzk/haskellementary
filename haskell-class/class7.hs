import Control.Applicative
type Parser a = String -> Maybe (a, String)

pure a = \s -> Just (a, s)
p <*> q =
  \s -> case p s of
    Nothing -> Nothing
    Just (f, s') -> case q s' of
      Nothing -> Nothing
      Just (x, s'') -> Just (f x, s'')

data Record = Record Int String Int
