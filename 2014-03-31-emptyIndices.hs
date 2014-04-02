import Data.List (findIndices)
import Data.Maybe (isNothing)

-- $setup
-- >>> import Control.Applicative

-- | emptyIndices List the indices of a list of maybes that contains Nothing
--
-- prop> (all (isNothing) .) . map . (!!) <*> emptyIndices $ xs
--
emptyIndices :: [Maybe a] -> [Int]
emptyIndices = findIndices isNothing

main = print ""