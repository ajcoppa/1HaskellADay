-- | chainEndos chain a list of endomorphisms to create a new one
-- Point-free version is feasible and redable.
-- Level: Easy
--
-- Examples:
--
-- >>> chainEndos [(+1),(*3)] 2
-- 7
-- >>> chainEndos [('h':),('e':)] "llo"
-- "hello"
--
-- >>> chainEndos [] (12 :: Int)
-- 12
--
chainEndos :: [a->a] -> a -> a
chainEndos fs x = foldr (\f accum -> f accum) x fs

chainEndosDolla :: [a->a] -> a -> a
chainEndosDolla fs x = foldr ($) x fs

chainEndosPointFree :: [a->a] -> a -> a
chainEndosPointFree = flip $ foldr ($)

main = do
  print $ chainEndosPointFree [('h':),('e':)] "llo"
  print $ chainEndosPointFree [] 12
  print $ chainEndosPointFree [(+1), (*3)] 2