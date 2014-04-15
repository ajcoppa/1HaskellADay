{- | stagedComputation

   Given a list of endofunctions and an initial value, stagedComputation returns
   the list of the staged computation of these functions
   (might be unclear, check the examples)

   Examples:

   >>> stagedComputation [(+1), (*2), subtract 3] 4
   [5,10,7]

   >>> stagedComputation [(++) "el", (:) 'h'] "lo"
   ["ello","hello"]

-}
stagedComputation :: [a->a] -> a -> [a]
stagedComputation fs x = tail $ scanl (flip ($)) x fs

stagedComputationPF :: [a->a] -> a -> [a]
stagedComputationPF = (tail .) . (flip $ scanl $ flip ($))

main = do
  print $ stagedComputationPF [(+1), (*2), subtract 3] 4
  print $ stagedComputationPF [(++) "el", (:) 'h'] "lo"
