-- $setup
-- >>> import Control.Applicative ((<*>))
-- >>> import Data.List (isInfixOf)
-- >>> import Test.QuickCheck

-- Level: Easy
-- Pointfree: yes


-- | mostRepeatedElem
-- Returns the element with the longest (consecutive) repetition and the
-- repetition number
-- If there are tie, the last most repeated element is returned
-- It returns error on empty string
-- 
-- Examples:
--
-- >>> mostRepeatedElem "hello world!"
-- ('l',2)
--
-- >>> mostRepeatedElem [1,1,2,2]
-- (2,2)
--
-- prop> (flip isInfixOf <*> uncurry (flip replicate) . mostRepeatedElem) . getNonEmpty

-- This is unsafe on empty lists, but there is no way to generate
-- an arbitrary value of type `a` if you wanted to make it safe.
mostRepeatedElem :: Eq a => [a] -> (a,Int)
mostRepeatedElem (x:xs) = mostRepeatedElemHelper (x, 1) (x, 1) xs

-- Naive recursive implementation
mostRepeatedElemHelper :: Eq a => (a,Int) -> (a,Int) -> [a] -> (a, Int)
mostRepeatedElemHelper best _ [] = best
mostRepeatedElemHelper best recent (x:xs) =
  let recentElem = fst recent
      recentCount = snd recent
      bestElem = fst best
      bestCount = snd best
      newRecent = if x == recentElem
        then (recentElem, recentCount+1)
        else (x, 1)
      newBest = if snd newRecent >= bestCount
        then newRecent
        else best
  in mostRepeatedElemHelper newBest newRecent xs

main = print ""