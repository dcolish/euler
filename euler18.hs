{-
    By starting at the top of the triangle below and moving to adjacent numbers on
    the row below, the maximum total from top to bottom is 23.

    3
    7 4
    2 4 6
    8 5 9 3

    That is, 3 + 7 + 4 + 9 = 23.

    Find the maximum total from top to bottom of the triangle below:
-}

import Data.List
import Data.Maybe

lineWords ::  String -> [[Integer]]
lineWords = readL.map(words).lines

readL ::  [[String]] -> [[Integer]]
readL = map(map(read))

-- we neeed to collapse backwards to the top of the triangle by finding the max
-- from each pair like max(0,0 + 1,0, 1,0 + 0,1) for all the elements in the
-- each row

moo ::  [[Integer]] -> [[Integer]] -> [Integer]
moo (x:xs) (l:ls) = map(maxList x) l : moo xs ls

maxList ::  (Ord a, Num a) => [a] -> [a] -> a
maxList (x:xs) (l:ls) = maximum $ map(+  ls) $ take 2 xs


zoo (z:zs) = map (moo) $  take 2 zs : zoo zs

foo = [3]

main = do
    f <- readFile "euler18.in"
    print $  zoo f


