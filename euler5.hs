-- project euler, #5
--

filterMod :: Integral a => a -> [a]
filterMod n = filter ((== 0). \x -> n `mod` x) [1..20]

isEvenDiv :: Integer -> Bool
isEvenDiv n
    | n < 2520 = False
    | (/= 20) $ length $ filterMod n = False
    | otherwise = True

