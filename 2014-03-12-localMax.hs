-- | localMax Given an entry list, it outputs the its list of local maxima.
-- A Local maximum is a an element greater than its predecessor and than its
-- successor.
--
-- No point-free today, at least for my solution.
--
-- Examples:
--
-- >>> localMax [0 .. 1000]
-- []
--
-- >>> localMax [1000 .. 0]
-- []
--
-- >>> localMax [2,2,1,5,4]
-- [5]
--
-- >>> take 4 . localMax $ [0..] >>= (\y -> [y,y+2])
-- [2,3,4,5]
--
localMax :: Ord a => [a] -> [a]
localMax (x:y:z:xs) = 
  localMaxOrEmptyList x y z ++ localMax (y:z:xs)
localMax _ = []

localMaxOrEmptyList :: Ord a => a -> a -> a -> [a]
localMaxOrEmptyList x y z =
  if isLocalMax x y z
  then [y]
  else []

isLocalMax :: Ord a => a -> a -> a -> Bool
isLocalMax x y z = y > x && y > z

main = do
  print $ localMax [2,2,1,5,4] -- [5]
  print $ localMax [1000 .. 0] -- []
  print $ localMax [3,2,1,4,2,5,3] -- [4,5]
  print $ take 4 . localMax $ [0..] >>= (\y -> [y,y+2]) -- [2,3,4,5]