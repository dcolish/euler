-- What is the greatest product of four adjacent numbers in any direction
-- (up, down, left, right, or diagonally) in the 20x20 grid?

import Data.List

-- convert lines in a string into a list of lists of integers
readEach ::  String -> [[Integer]]
readEach = map (map read) . map words . lines

-- takes the input of a list of horizonal lines and makes them vertical
vert :: [[a]] -> [[a]]
vert = transpose

main = do
    f <- readFile "euler11.in"
    print $ vert . readEach $ f





