-- | Sort a list of list of elements by the maximum of each list,
-- in ascending order
--
-- Point-free: easy and readable
-- Level: EASY
--
-- Examples:
-- >>> sortByMax [[1,10],[5,5]]
-- [[5,5],[1,10]]
-- >>> sortByMax []
-- []
--
-- sortByMax [[], [1,2]]
-- should throw an execption: no max for empty list

import Data.Ord (comparing)
import Data.List (sortBy)

-- sortByMax :: Find the most generic signature
sortByMax :: Ord a => [[a]] -> [[a]]
sortByMax xss = sortBy (comparing maximum) xss

main = do
  print $ sortByMax [[1,10],[5,5]]
  print $ sortByMax [[1,10], [2,9], [8,3], [4,7], [5,6]]
  print $ sortByMax ([] :: [[Int]])
  print $ sortByMax [[], [1,2]]