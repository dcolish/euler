import Data.Numbers
import Data.Numbers.Primes

-- main = do 
--   print $show $ max $ map(length . primeFactors) [1..10^6]

foo = [ y | x <- [1..], let y = sum (take x)[1..] ]

-- test f (x:xs) = if x == f then f else test f) $ x
sumOfPrimes :: Integer -> Integer -> [Integer] -> Bool
sumOfPrimes x = takeWhile( -> 
  | x == y  = True
  | y > x   = False
  | otherwise  = sumOfPrimes x (y+z) zs