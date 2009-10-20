-- Surprisingly there are only three numbers that can be written as the sum of
-- fourth powers of their digits:
--
-- 1634 = 1^(4) + 6^(4) + 3^(4) + 4^(4)
-- 8208 = 8^(4) + 2^(4) + 0^(4) + 8^(4)
-- 9474 = 9^(4) + 4^(4) + 7^(4) + 4^(4)
--
-- As 1 = 1^(4) is not a sum it is not included.
--
-- The sum of these numbers is 1634 + 8208 + 9474 = 19316.
--
-- Find the sum of all the numbers that can be written as the sum of
-- fifth powers of their digits.
--
-- Really we only have the digits 1^5 - 9^5 to use for this
--
--
--

import Data.List

nlist ::  Integer -> [Integer]
nlist = reverse.unfoldr (\x -> if x == 0 then Nothing else Just( x `mod` 10, x `div` 10))

-- This upper bound was provided by a few good guesses
-- looking on the forums it is shown the largest possible power is 9^5
-- this means that any number larger than 6 digits will be impossible
-- achieve even if we have the number 99999999999
--
-- Really it is much more performant if we cap this at 9^5*6
myNums ::  [Integer]
myNums = [ x | x <-[2..(9^5*6)], x == sumDigits x ]


mapPow :: Integer -> [Integer]
mapPow = map (^5).nlist

sumDigits :: Integer -> Integer
sumDigits =  sum . mapPow


main = print $ sum $ myNums


