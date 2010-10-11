import Data.Numbers
import Data.Numbers.Primes

triNums = [ y | x <- [1..], let y = sum [1..x] ]

main = print $ takeWhile(\(a, b) -> b < 501) $ map (fact) $ triNums

fact x 
  | isPrime x = (x, 1)
  |otherwise = (x, numOfFactors x)

