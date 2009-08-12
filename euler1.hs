import Data.List


eu1 = sum $ union (filter ((==  0). \x -> x `mod` 5)  [1..999])
				  (filter ((==  0). \x -> x `mod` 3)  [1..999])

