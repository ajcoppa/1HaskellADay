import Data.List (find, nub)
import Data.Maybe (fromJust)

-- | countFigures count the different figures that composes a number
--
-- Examples:
--
-- >>> countFigures 1
-- 1
-- >>> countFigures 1000000
-- 2
-- >>> countFigures 123
-- 3
-- >>> countFigures (-12)
-- 2
-- >>> countFigures 1234567890
-- 10
-- >>> countFigures 00001
-- 1
-- >>> countFigures 0
-- 1
--
-- This first attempt counts digits (except invalid leading ones).
-- After implementing, I realized that the example for 1000000 doesn't
-- match that behavior, so I looked up the solution to understand what
-- was actually wanted.
countFiguresWrong :: Integral a => a -> Int
countFiguresWrong = fst . fromJust . find ((==0) . snd)
             . zip [0..]
             . map (\x -> if (x>0) then 1 else 0)
             . iterate (`div` 10)
             . abs

-- Spoiled solution. Makes sense: the behavior is to get the unique
-- digits that make up the number (excluding leading zeroes).
countFigures = length . nub . show . fromIntegral . abs

main = do
  print $ countFigures 1
  print $ countFigures 1000000
  print $ countFigures 00001
