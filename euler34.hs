--
-- 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
--Find the sum of all numbers which are equal to the sum of the factorial of
--their digits.
--


import Data.List

nlist = reverse.unfoldr (\x -> if x == 0 then Nothing else Just( x `mod` 10, x `div` 10))

factorial n = product.reverse $ [ x | x <- [1..n] ]

sumMapFact = sum.map(factorial).nlist


foo = [x | x <- [3..999999], x == sumMapFact x]

main = print $ sum $foo


