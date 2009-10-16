import Data.List

-- get all the characters of a number into a list
nlist ::  Integer -> [Integer]
nlist = reverse.unfoldr (\x -> if x == 0 then Nothing else Just( x `mod` 10, x `div` 10))

-- sum a list of strings that are numbers
sumStrings ::  (Num a, Read a) => String -> a
sumStrings ns = sum $ map (read) $ words ns

-- sum a list of numbers and then show the first 10 digits
finalStr ::  String -> [Char]
finalStr ns = concatMap (show) $ take 10. nlist.sumStrings $ ns

main = do
    f <- readFile "euler13.in"
    print $  finalStr $ f

