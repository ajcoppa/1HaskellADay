import Control.Monad

-- div all the elements of the list (2nd parameter) by the first parameter
-- iff all the elements of the lists are exact multiple of the first parameter
-- returns nothing otherwise 
divIfMultiple :: Integral a => a -> [a] -> Maybe [a]
divIfMultiple x = undefined

main = do
  _ <- print $ divIfMultiple 3 [3, 6 .. 12]  -- Just [1,2,3,4]
  _ <- print $ divIfMultiple 2 [3, 6 .. 12]  -- Nothing
  return ()