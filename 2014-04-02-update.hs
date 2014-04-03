import Control.Monad (mfilter)

-- | update update the nth element of a list
-- if the index is not a valid index, it leaves the list unchanged
--
-- Examples
--
-- >>> update (-2) 10 [0..4]
-- [0,1,2,3,4]
--
-- >>> update 6 10 [0..4]
-- [0,1,2,3,4]
--
-- >>> update 2 10 [0..4]
-- [0,1,10,3,4]
--
update :: Int -> a -> [a] -> [a]
update index x xs =
  let splitXs = splitAt index xs
      left = fst splitXs
      right = tail $ snd splitXs
      newXs = left ++ [x] ++ right
  in if index < 0 || index >= length xs
  then xs
  else newXs

main = do
  print $ update (-2) 10 [0..4]
  print $ update 6 10 [0..4]
  print $ update 2 10 [0..4]