import Control.Applicative

-- use elements of the first lists to zip elements
-- of the second and third lists
-- zipBinary [(+), (*), (*)] [2,2,2] [4,4,4] == [6,8,8]
-- zipBinary [(+)] [2,2,2] [4,4,4] == [6]

zipBinary :: [a->b->c] -> [a] -> [b] -> [c]
zipBinary = zipWith3 id

main = print $
  zipBinary (cycle [(+), (*)]) [1 .. 4] [2..5] -- [3, 6, 7, 20]