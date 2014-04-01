-- | compact Compact a list of values with the following rules:
-- - Nothing are removed
-- - If two remaining onsecutive values are equal,
--     they are replaced by one value equal to the successor of those values
-- - the previous rule is not recursive
-- - Other values are kept
--
-- Examples
--
-- >>> compact [Just 1, Nothing, Just 1, Just 2, Just 4, Just 3, Just 3]
-- [2,2,4,4]
--
-- >>> compact [Nothing, Nothing, Nothing]
-- []
--
-- >>> compact []
-- []
--
-- >>> compact $ map Just "hello"
-- "hemo"
--
-- prop> [succ x] == (compact . replicate 2 . Just) (x :: Int)
-- prop> [succ x, x] == (compact . replicate 3 . Just) (x :: Int)
-- prop> replicate 2 (succ x) == (compact . replicate 4 . Just) (x :: Int)
--
import Data.Maybe (fromJust)

compact :: (Enum a, Eq a) => [Maybe a] -> [a]
compact = map fst . foldr folder [] . map fromJust . filter (/= Nothing)

-- Produces a list of pairs.
-- The Bool value indicates whether this value was already compacted
-- so we can avoid compacting a given element twice.
folder :: (Enum a, Eq a) => a -> [(a,Bool)] -> [(a, Bool)]
folder x accum =
  if null accum || snd (head accum) || fst (head accum) /= x
  then (x, False) : accum
  else (succ x, True) : tail accum

main = do
  print $ compact [Just 1, Nothing, Just 1, Just 2, Just 4, Just 3, Just 3]
  print $ compact ([Nothing, Nothing, Nothing] :: [Maybe Int])
  print $ compact ([] :: [Maybe Int])
  print $ compact $ map Just "hello"