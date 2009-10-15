-- What is the sum of the digits of the number 2^(1000)?
--

import Data.List


nlist = unfoldr (\x -> if x == 0 then Nothing else Just( x `mod` 10, x `div` 10))

main = print $ sum $ nlist $ 2^1000



