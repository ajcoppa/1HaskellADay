-- sum the value inside the maybe if there aren't any Nothing,
-- otherwise return Nothing
-- sumIfAll [Just 1, Just 2] == Just 3
-- sumifAll [Just 1, Nothing] == Nothing

import Control.Applicative

sumIfAll :: Num a => [Maybe a] -> Maybe a
sumIfAll = foldr (\total x -> pure (+) <*> x <*> total) (Just 0)

main = do
  print . sumIfAll . fmap Just $ [1 .. 4]
  print $ sumIfAll [Just 1, Just 2]
  print $ sumIfAll [Just 1, Nothing, Just 88]