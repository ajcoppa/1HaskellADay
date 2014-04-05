import Data.List (groupBy)
import Control.Applicative ((<*>))
import Control.Monad (liftM, replicateM)

import Test.QuickCheck

-- Preamble

-- $setup
-- >>> import Control.Applicative ((<$>), (<*>))
-- >>> import Data.List (sort)
-- >>> :{
--   let checkReverse d1 d2 =
--     (==) <$>
--        sort . map head . getList . viewFrom d1 <*>
--        sort . map last . getList . viewFrom d2 
-- :}

newtype Board a = Board {getList :: [[a]]}
  deriving (Eq, Show)

data Direction = North | South | East | West
  deriving (Eq, Read, Show)

-- Exercise

-- | viewFrom move the element of a list of lists as they are "seen from a
-- given direction
-- 
--                   North
-- 
--         [ [a00, a01, a02, a03]
--  West   , [a10, a11, a12, a13]    East
--         , [a20, a21, a22, a23]
--         , [a30, a21, a32, a33] ]
--
--                  South
--
-- Examples: 
--
-- prop> xs == viewFrom West xs
-- prop> \(d,xxs) -> (==) <*> (viewFrom d . viewFrom d) $ (xxs :: Board Int)
-- prop> checkReverse West  East  (xxs :: Board Int)
-- prop> checkReverse East  West  (xxs :: Board Int)
-- prop> checkReverse North South (xxs :: Board Int)
-- prop> checkReverse South North (xxs :: Board Int)
--
viewFrom :: Direction -> Board a -> Board a
viewFrom d = let
  go West  = id
  go East  = reverse . map reverse
  go North = transpose
  go South = reverse . map reverse . transpose
  in Board . go d . getList


-- Constructor

-- | board Yesterday's squareOf, build a square board with initial values
board :: Int -> a -> [a] -> [[a]] 
board n x = take n . map (take n) . iterate (drop n) . (++ repeat x)

-- Arbitrary instances

instance Arbitrary a => Arbitrary (Board a) where 
  arbitrary = liftM Board (arbitrary >>= replicateM <*> vector)

instance Arbitrary Direction where
  arbitrary = elements [North, South , East , West]