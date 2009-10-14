-- project euler, #5
--

filterMod :: Integral a => a -> [a]
filterMod n = filter ((== 0). \x -> n `mod` x) [2,3,5,7,11,13,17,19,20]

isEvenDiv :: Integer -> Bool
isEvenDiv n
    | n `mod` 2520 /=0 = False
    | n `mod` 11 /= 0 = False
    | n `mod` 12 /= 0 = False
    | n `mod` 13 /= 0 = False
    | n `mod` 14 /= 0 = False
    | n `mod` 15 /= 0 = False
    | n `mod` 16 /= 0 = False
    | n `mod` 17 /= 0 = False
    | n `mod` 18 /= 0 = False
    | n `mod` 19 /= 0 = False
    | n `mod` 20 /= 0 = False
    | otherwise = True

{-
isEvenDiv :: Integer -> Bool
isEvenDiv n
    | (/= 9) $ length $ filterMod n = False
    | otherwise = True
-}

--foo = [x | x <- [100000000..1000000000], isEvenDiv x]
foo = 2^4 * 3^2 * 5* 7 *11 *13 *17 *19


main = print  foo
