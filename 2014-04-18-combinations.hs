{- | combinations
   Builds all the combinations of length n of the elements of the initial list.

   Examples:

   >>> combinations 2 [0,1]
   [[0,0],[0,1],[1,0],[1,1]]

   >>> combinations 3 ['a','b']
   ["aaa","aab","aba","abb","baa","bab","bba","bbb"]

   >>> combinations (-2) ['a'..'z']
   [""]
-}
combinations :: Int -> [a] -> [[a]]
combinations = undefined
