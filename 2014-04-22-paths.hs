module HAD.Y2014.M04.D22.Exercise where

import Data.Tree

{- | paths
   list all the possible paths in a Tree

   Example:

   >>> paths $ Node 1 [Node 2 [],Node 3 [ Node 4 []]]
   [[1,2],[1,3,4]]

   >>> paths $ Node 'h' [Node 'a' [Node 'd' []], Node 'e' [Node 'l' [Node 'l' []]]]
   ["had","hell"]
-}
paths :: Tree a -> [[a]]
paths = undefined
