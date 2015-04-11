 
doit :: Maybe Int -> IO Int
doit x = 
  case x of 
    Nothing -> do
      return 5
    Just foo -> do
      return foo
