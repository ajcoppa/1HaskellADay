-- $setup
-- >>> import Test.QuickCheck
-- >>> import Data.Maybe (fromJust)

-- | minmax
-- get apair of the min and max element of a list (in one pass)
-- returns Nothing on empty list
--
-- Point-free: checked
--
-- The function signature follows the idea of the methods in the System.Random
-- module: given a standard generator, you returns the modified list and the
-- generator in an altered state.
--
-- >>> minmax [0..10]
-- Just (0,10)
--
-- >>> minmax []
-- Nothing
--
-- prop> \(NonEmpty(xs)) -> minimum xs == (fst . fromJust . minmax) xs
-- prop> \(NonEmpty(xs)) -> maximum xs == (snd . fromJust . minmax) xs
--
-- Naive recursive implementation
minmax :: Ord a => [a] -> Maybe (a,a)
minmax [] = Nothing
minmax (x:xs) = minmaxHelper x x xs

minmaxHelper :: Ord a => a -> a -> [a] -> Maybe (a,a)
minmaxHelper currentMin currentMax [] = Just (currentMin, currentMax)
minmaxHelper currentMin currentMax (x:xs) =
  let newMin = min x currentMin
      newMax = max x currentMax
  in minmaxHelper newMin newMax xs

main = print $ minmax [0..10]