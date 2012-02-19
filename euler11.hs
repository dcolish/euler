-- What is the greatest product of four adjacent numbers in any direction
-- (up, down, left, right, or diagonally) in the 20x20 grid?
import Data.List

-- convert lines in a string into a list of lists of integers
-- For each line, split it into words and read them as values (Integers)
readEach ::  String -> [[Integer]]
readEach = map (map read .  words) . lines

-- Below is bad. Should split the entire grid into overlaping 4x4 squares.
-- In each square the max of the horz, vert, ldiag, rdiag can be calculated and returned.
-- Then the final max will the max of all subsquares

sumLine (l:ls)
  | length ls < 3 = []
  | otherwise  = [product $ take 4 (l:ls)] : sumLine ls
sumLine [] = []

fixUp = concat . filter (\(x:xs) -> x > 0 )

-- Maybe some sort of zip? similar to sumline create a window over the columns
-- and shift it as we traverse
-- work on rows here not columns
diag (x:xs) n = drop (n) x : diag (xs) (n + 1)
diag [] _ = []

diagnolize (l:ls) = concatMap (take 1) (l:ls) : diagnolize (map (drop 1) ls)
diagnolize [] = []

main = do
  f <- readFile "euler11.in"
  let rows = readEach $ f
  print $ maximum [calc_max rows,
                   (calc_max . transpose) rows,
                   diag_max rows, 
                   (diag_max . transpose) rows,
                   (diag_max . map (reverse)) rows,
                   (diag_max . transpose . map (reverse)) rows]
    where
      calc_max ls = maximum $ concat . map (fixUp . sumLine) $ ls
      bot_diag r = calc_max $ diagnolize $ diag r 0
      top_diag r = calc_max $ diagnolize $ diag (map (reverse) r) 0
      diag_max r = maximum [top_diag r, bot_diag r]





