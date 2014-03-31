-- Codepad doesn't support module

-- module HAD.Y2014.M03.D25.Exercise
--   ( Board
--   , board
--   , getList
--   ) where

import Data.List (groupBy)
import Test.QuickCheck
import Test.QuickCheck.Gen

-- Preamble

-- $setup
-- >>> import Control.Applicative ((<$>), (<*>))
-- >>> import Data.List (group)

-- A board is a "square list of list"
-- The "square" form, is ensure by the constructor (board)
newtype Board a = Board {getList :: [[a]]}
  deriving (Eq, Show, Read)

-- | Exercise
-- Build an Arbitrary instance for Board of any given size
--
-- The external list length is equal to the length of each internal lists
-- prop> (1==) . length . group . (flip (:) <*> length) . map length $ getList bs
--
instance Arbitrary a => Arbitrary (Board a) where 
  arbitrary = do
    size <- suchThat arbitrary (>1)
    as <- infiniteList
    a <- arbitrary
    return $ Board $ board size a as

-- Just some extra content, it isn't useful for today's exercise

-- Constructor

-- | board Yesterday's squareOf, build a square board with initial values
board :: Int -> a -> [a] -> [[a]] 
board n x = take n . map (take n) . iterate (drop n) . (++ repeat x)

-- WARNING: codepad doesn't sample
main = sample (arbitrary :: Gen (Board Int))