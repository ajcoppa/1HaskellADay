module HAD.Y2014.M04.D10.Exercise where

import Control.Monad (join)

{- | onBothSide
   Apply the same argument on both side of a binary numeric function.

   The only interesting solution is point-free.

   It IS the easiest exercise so far, with the shortest solution.

   Examples:
   >>> onBothSide (+) 4
   8

   >>> onBothSide (*) 4
   16
-}

-- They spoiled this by tweeting out the solution. :(
onBothSide :: (a -> a -> b) -> a -> b
onBothSide = join

main = print ""
