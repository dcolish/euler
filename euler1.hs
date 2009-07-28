import Data.List
let myFilter y = filter ((==  0). \x -> x `mod` y)  [1..1000]

let myCounter y = foldl (+) 0 $ myFilter y

foldl (+) 0 $union  (myFilter 5)  (myFilter 3)

