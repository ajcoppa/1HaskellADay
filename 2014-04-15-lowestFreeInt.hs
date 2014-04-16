{- | lowestFreeInt
   Find the lowest non-negative integer not in the list

   (Thanks to @clementd for this one)

   Example:

   >>> lowestFreeInt [0..10]
   11

   >>> lowestFreeInt [1..10]
   0

   >>> lowestFreeInt $ [0..9] ++ [2000,1999..11]
   10
-}
lowestFreeInt :: [Int] -> Int
lowestFreeInt = undefined

main = print ""
