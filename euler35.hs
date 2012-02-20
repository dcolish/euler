-- 
-- The number, 197, is called a circular prime because all rotations of the
-- digits: 197, 971, and 719, are themselves prime.
--
-- There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71,
-- 73, 79, and 97.
--
-- How many circular primes are there below one million?
--
import Data.Numbers.Primes
import Data.List

nlist ::  Integer -> [Integer]
nlist = unfoldr (\x -> if x == 0 then Nothing else Just( x `mod` 10, x `div` 10))

unlist :: [Integer] -> Integer
unlist [] = 0
unlist [n] = n
unlist (n:ns)
        | n /= 0 = ((10 ^ (length ns)) * n) + unlist ns
        | otherwise = (10 ^ (length ns)) + unlist ns

isCircular x = all (== True) . map (isPrime . unlist) . permutations $ nlist x

main = print $ length  [x | x <- primes, x < 1000000, isCircular x]


