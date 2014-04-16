module HAD.Y2014.M04.D16.Exercise where

import Data.Char (toUpper)

{- | reverseMap
   No definition, look to types
-}
reverseMap :: [a -> b] -> a -> [b]
reverseMap [] x = []
reverseMap (f:fs) x = f x : reverseMap fs x

reverseMap' :: [a -> b] -> a -> [b]
reverseMap' fs x = map ($ x) fs

main = do
  print $ reverseMap' [id, (+1), (+2)] 0
  print $ reverseMap' [(++ "!"), ("Hmm. " ++), map toUpper] "I'm a teapot"
