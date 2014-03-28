-- | checkSort verify if a given list is sorted
-- Point-free version is hard to find BUT is redable.
-- Level: Medium
--
-- Examples:
--
-- >>> checkSort ([1..10] :: [Int])
-- True
--
-- >>> checkSort $ ([1,3,2] :: [Int])
-- False
--
-- >>> checkSort []
-- True
--
checkSort :: Ord a => [a] -> Bool
checkSort [] = True
checkSort [_] = True
checkSort (x:y:xs) = (x <= y) && checkSort (y:xs)

main = do
  print $ checkSort [1..10]
  print $ checkSort [1,3,2]
  print $ checkSort ([] :: [Int])
  print $ checkSort [1]