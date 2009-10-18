-- Find the sum of digits in 100!

import Data.List

factorial n = product.reverse $ [ x | x <- [1..n] ]

nlist = unfoldr (\x -> if x == 0 then Nothing else Just( x `mod` 10, x `div` 10))

lSum n = sum $ nlist $ factorial n

