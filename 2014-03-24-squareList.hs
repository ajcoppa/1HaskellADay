-- | squareList builds a list of x lists of size x from a given list of elements
-- If there aren't enough elements, fill the square with the second parameter
-- Examples:
--
-- >>> squareList 2  0 [0..]
-- [[0,1],[2,3]]
--
-- >>> squareList 2 0 [1]
-- [[1,0],[0,0]]
--
-- >>> squareList 3 () $ repeat ()
-- [[(),(),()],[(),(),()],[(),(),()]]
--
squareList :: Int -> a -> [a] -> [[a]] 
squareList size filler xs =
  squareListHelper size size filler xs []

squareListHelper :: Int -> Int -> a -> [a] -> [[a]] -> [[a]]
squareListHelper _ 0 _ _ accum = accum
squareListHelper size sizeRemaining filler xs accum =
  let sourceList = xs ++ cycle [filler]
      newXs = drop size xs
      newAccum = accum ++ [take size sourceList]
  in squareListHelper size (sizeRemaining - 1) filler newXs newAccum

main = do
  print $ squareList 2 0 [0..]
  print $ squareList 2 0 [1]
  print $ squareList 3 () $ repeat ()