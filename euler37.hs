import Data.Numbers
import Data.Numbers.Primes


isTruncLeft n =  all(checkList) $ buildLeftTrunc n
isTruncRight n = all(checkList) $ buildRightTrunc n

checkList n 
  | n == 1 = False
  | isPrime n  = True
  | otherwise = False


buildLeftTrunc :: Integer -> [Integer]
buildLeftTrunc n = [z | x <- [1..(length $ show n) - 1], let z = read $ drop x $ show n]
buildRightTrunc :: Integer -> [Integer]
buildRightTrunc n = [z | x <- [1..(length $ show n) - 1], let z = read $ take x $ show n]

isFullyTrunc n
  | isTruncRight n && isTruncLeft n = True
  | otherwise = False

truncPrimes = [x | x <- primes, x > 7,  isFullyTrunc x]

main = do
  print $ sum $ take 11 truncPrimes