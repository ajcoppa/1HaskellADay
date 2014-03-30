-- | addNoise
-- add "noise" to a list of number: each number is modified by a
-- random value between -x and x (where x is the first parameter of the
-- function.
-- The function should work for positive AND negative values.
--
-- Quite easy
-- I didn't try it pointfree
-- I didn't try to find a one-liner
--
-- The function signature follows the idea of the methods in the System.Random
-- module: given a standard generator, you returns the modified list and the
-- generator in an altered state.
--
import System.Random

addNoise :: (Num a, Random a) => a -> [a] -> StdGen -> ([a], StdGen)
addNoise _ [] gen = ([], gen)
addNoise noise (x:xs) gen =
  let range = calculateRange noise
      startingPair = scanner range (0, gen) x
      valueGenPairsWithNoiseAdded = scanl (scanner range) startingPair xs
      valuesWithNoiseAdded = map fst valueGenPairsWithNoiseAdded
      lastGen = snd $ last valueGenPairsWithNoiseAdded
  in (valuesWithNoiseAdded, lastGen)

calculateRange :: (Num a) => a -> (a, a)
calculateRange x = let positiveX = abs x
  in (-positiveX, positiveX)

scanner :: (Num a, Random a) => (a, a) -> (a, StdGen) -> a -> (a, StdGen)
scanner range lastValue x =
  let gen = snd lastValue
      noiseAndNewGen = randomR range gen
      noise = fst noiseAndNewGen
      newGen = snd noiseAndNewGen
      newX = noise + x
  in (newX, newGen)

main = do
  gen <- getStdGen
  let xs = iterate (*10) 1
  print $ take 10 $ fst $ addNoise 5 (xs :: [Int]) gen
  print $ fst $ addNoise 1 ([] :: [Int]) gen