-- | thirdOfFive
-- return the third of five arguments
--
-- No other interest than pointFree
--
-- prop> thirdOfFive 1 2 x 4 5 == x
--
-- Found courtesy of lambdabot in #haskell
thirdOfFive :: a -> b -> c -> d -> e -> c
thirdOfFive = const $ const $ const . const