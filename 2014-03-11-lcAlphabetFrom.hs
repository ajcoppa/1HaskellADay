-- | lcAlphabetFrom
-- Display the alaphabet in lower cas, starting from the letter given in
-- parameter.
-- If the parameter is not a lowercase letter, displays the alphabet from 'a'
--
-- Point-free is quite easy
--
-- Examples:
--
-- >>> lcAlphabetFrom 'a'
-- "abcdefghijklmnopqrstuvwxyz"
--
-- >>> lcAlphabetFrom 'e'
-- "efghijklmnopqrstuvwxyzabcd"
--
-- >>> lcAlphabetFrom '`'
-- "abcdefghijklmnopqrstuvwxyz"
--
-- >>> lcAlphabetFrom '{'
-- "abcdefghijklmnopqrstuvwxyz"

import Data.Char

lcAlphabetFrom :: Char -> String
lcAlphabetFrom = take 26 . iterate (validateChar . nextChar) . validateChar

nextChar :: Char -> Char
nextChar = chr . (+1) . ord 

validateChar :: Char -> Char
validateChar c = if c >= 'a' && c <= 'z' then c else 'a'

main = do
  print $ lcAlphabetFrom 'a' -- "abcdefghijklmnopqrstuvwxyz"
  print $ lcAlphabetFrom 'e' -- "efghijklmnopqrstuvwxyzabcd"
  print $ lcAlphabetFrom '`' -- "abcdefghijklmnopqrstuvwxyz"
  print $ lcAlphabetFrom '{' -- "abcdefghijklmnopqrstuvwxyz"