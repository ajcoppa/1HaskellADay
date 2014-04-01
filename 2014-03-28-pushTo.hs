import Data.List (group, groupBy, transpose)
import Data.Maybe (maybe, listToMaybe, catMaybes)
import Control.Applicative ((<*>), (<$>))
import Control.Monad (liftM, replicateM)

import Test.QuickCheck

-- Preamble

-- $setup
-- >>> import Control.Applicative ((<$>), (<*>))
-- >>> import Data.List (group, sort)
-- >>> :{
--   let checkReverse d1 d2 =
--     (==) <$>
--        sort . map sort . getList . viewFrom d1 <*>
--        sort . map (sort . reverse) . getList . viewFrom d2 
-- :}

newtype Board a = Board {getList :: [[a]]}
  deriving (Eq, Show)

data Direction = North | South | East | West
  deriving (Eq, Read, Show)

-- pushTo Push elements of the board to one direction, and compact them
-- (with a behavior similar to the one of the compact function defined
-- yesterday) and fill with Nothings to get a new Board
--
-- (yes, it is the same behavior as 2048):
-- http://gabrielecirulli.github.io/2048/
--
pushTo :: Direction -> Board (Maybe Int) -> Board (Maybe Int)
pushTo = undefined

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
compact :: (Enum a, Eq a) => [Maybe a] -> [a]
compact = 
  map (flip maybe succ <$> head <*> listToMaybe . tail)
    . ((takeWhile (not . null) . map (take 2) . iterate (drop 2)) =<<)
    . group . catMaybes


-- Arbitrary instances

-- Build an Arbitrary instance for Board of any given size
--
-- The external list length is equal to the length of each internal lists
instance Arbitrary a => Arbitrary (Board a) where 
  arbitrary = liftM Board (arbitrary >>= replicateM <*> vector)

instance Arbitrary Direction where
  arbitrary = elements [North, South , East , West]