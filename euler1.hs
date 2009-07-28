import Data.List


eu1 = sum $ union (filter ((==  0). \x -> x `mod` 5)  [1..1000])
				  (filter ((==  0). \x -> x `mod` 3)  [1..1000])

