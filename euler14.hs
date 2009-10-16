-- Given the follow set definition
-- n -> n/2 (n is even)
-- n -> n + 1 (n is odd)
--
-- What is the longest sequence that can be generated using a number under 1
-- million.
--

import Data.List

step :: Integral a => a -> a
step n
    | even n = n `div` 2
    | odd n  = 3 * n + 1

l :: Integral a => a -> [a]
l 1 = [1]
l n = n :  l (step n)

foo :: [(Integer, [Integer])]
foo =  [ (x , l x) | x <- [1..(1*10^6)]]

tupL :: (Integer,[Integer]) -> (Int,Integer)
tupL (n,l) = (length l, n)

maxL ::  [(Integer,[Integer])] -> (Int, Integer)
maxL l = maximum.sort $ map (tupL) l

main = print $ maxL $ foo

