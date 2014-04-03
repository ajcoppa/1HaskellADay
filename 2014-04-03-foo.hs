import Control.Arrow

-- | foo
-- Types. Powerful enough to get it right.
--
-- Examples:
-- >>> foo (+10) [0..4]
-- [(0,10),(1,11),(2,12),(3,13),(4,14)]
-- 
-- prop> (foo id (xs :: [Int])) == (fooWithArrow id xs)
-- prop> (foo id (xs :: [Char])) == (fooPointFree id xs)
foo :: (a -> b) -> [a] -> [(a,b)]
foo f xs = zip xs (map f xs)

fooWithArrow :: (a -> b) -> [a] -> [(a,b)]
fooWithArrow f = map $ id &&& f

fooPointFree :: (a -> b) -> [a] -> [(a,b)]
fooPointFree = map . (id &&&)

main = print ""