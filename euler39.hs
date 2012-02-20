-- If p is the perimeter of a right angle triangle with integral length sides,
-- {a,b,c}, there are exactly three solutions for p = 120.

-- {20,48,52}, {24,45,51}, {30,40,50}

-- For which value of p ≤ 1000, is the number of solutions maximised?

-- import Control.Parallel.Strategies 
import Data.List

sortedSets = [sum [a, b, sqrt(a^2 + b^2)] | a <- [1..425], b <- [1..a]]

isInt a
  | floor a == ceiling a = True
  | otherwise = False
  
comp (a, aLen) (b, bLen) 
  | aLen < bLen = GT
  | otherwise   = LT

findMax =  head . sortBy comp . map (\x -> (head x, length x)) . group . sort .
           filter (\x -> isInt x && x <= 1000)

main = do
  print $ findMax $ sortedSets
