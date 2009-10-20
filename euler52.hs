-- It can be seen that the number, 125874, and its double, 251748, contain
-- exactly the same digits, but in a different order.
--
-- Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and
-- 6x,contain the same digits.
-- 

import Data.List

nlist ::  Integer -> [Integer]
nlist = sort.unfoldr (\x -> if x == 0 then Nothing else Just( x `mod` 10, x `div` 10))



test x n
    | (== nlist n) $ nlist $ (* x) n  = True
    | otherwise = False

foo = [x | x<-[10000..1000000], test 2 x == True, test 3 x == True, test 4 x == True, test 5 x == True, test 6 x == True]

main = print $ foo
