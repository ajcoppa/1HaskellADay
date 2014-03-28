-- | takeStrictlyLessThan take elements of a list whils their sum is
-- _strictly_ less than a given number
--
-- Point-free: I didnt' try without parameter, you can easily "hide" the 2nd
-- parameter (ie. takeStrictlyLessThan x = ÔÇª)
-- Level: MEDIUM
--
-- Examples:
-- >>> takeStrictlyLessThan (10::Int) [1..]
-- [1,2,3]
--
-- >>> takeStrictlyLessThan (3::Integer) $ repeat 1
-- [1,1]
--
-- >>> takeStrictlyLessThan (42::Int) $ []
-- []
--
-- takeStrictlyLessThan :: Choose your poison
takeStrictlyLessThan :: Int -> [Int] -> [Int]
takeStrictlyLessThan n xs = takeStrictlyLessThanAccum n 0 xs

takeStrictlyLessThanAccum :: Int -> Int -> [Int] -> [Int]
takeStrictlyLessThanAccum n accum [] = []
takeStrictlyLessThanAccum n accum (x:xs) =
  if accum + x < n
    then x : takeStrictlyLessThanAccum n (accum + x) xs
    else []

main = do
  print $ takeStrictlyLessThan (10::Int) [1..]
  print $ takeStrictlyLessThan (3::Int) $ repeat 1
  print $ takeStrictlyLessThan (42::Int) $ []