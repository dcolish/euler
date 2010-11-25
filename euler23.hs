import Control.Parallel
import Control.Parallel.Strategies
import Data.List
import Data.Numbers

                
abudantNums :: [Integer]
abudantNums = [x | x <- [12..28123], isAbundant x]
  where
    isAbundant n
      | (sum $ factors n) > n = True
      | otherwise = False

possibilities = concat $  [x | y <- abudantNums, 
                           let x = parMap (sort.nub) $
                                   parMap(rwhnf) (sum) $
                                   parMap(rwhnf) (:[y]) abudantNums]
main = do
  print $ length possibilities