-- | trueIndexes produce an infinite list where only the index given in the list

-- in parameter are true.
-- The parameter list is supposed to be sorted set of positive numbers
--
-- Point-free: Probably hard to find!
-- Level: HARD
--
-- Examples:
-- >>> take 2 $ trueIndexes [1]
-- [False,True]
--
-- >>> take 6 $ trueIndexes [0,2,4]
-- [True,False,True,False,True,False]
--
-- >>> take 3 $ trueIndexes []
-- [False, False, False]
--
trueIndexes :: [Int] -> [Bool]
trueIndexes = trueIndexes' [] 0

trueIndexes' :: [Bool] -> Int -> [Int] -> [Bool]
trueIndexes' accum baseIndex [] = accum ++ cycle [False]
trueIndexes' accum baseIndex (x:xs) = 
  let howManyFalses = if x-1-baseIndex < 0 then 0 else x-1-baseIndex
      newAccum = accum ++ (take howManyFalses $ cycle [False]) ++ [True]
  in trueIndexes' newAccum x xs

main = do
  print $ take 18 $ trueIndexes [0,2,4]
  print $ take 3 $ trueIndexes []