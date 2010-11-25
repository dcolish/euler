import Data.Char
import Data.List
import Numeric

binDecPalins = [x | x <- [1..10^6], palin $ toBinary x, palin $ show x]

palin x 
  | x == (reverse x) = True
  | otherwise = False

toBinary x = showIntAtBase 2 intToDigit x ""

main = do
  print $ sum $ binDecPalins