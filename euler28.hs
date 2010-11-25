-- Starting with the number 1 and moving to the right in a clockwise direction a
-- 5 by 5 spiral is formed as follows:
--  43 44 45 46 47 48 49 50
--  42 21 22 23 24 25 26 51
--  41 20  7  8  9 10 27 
--  40 19  6  1  2 11 28
--  39 18  5  4  3 12 29 
--  38 17 16 15 14 13 30
--  37 36 35 34 33 32 31
-- It can be verified that the sum of the numbers on the diagonals is 101.

-- Corners will be every 1, 3, 5, .. per level, there are 4 counts per level

-- or just count odds by 2, 4, 6...

oddInts = [3,5..]
evenInts = [2,4..]

cycleCount (n, level)
  | n `mod` 4 == 0 = cycleCount ((n + 1), (level + 1))
  | otherwise = (n + 1, level)

-- cycleCount(x, 1) 
