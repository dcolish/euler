-- Starting with the number 1 and moving to the right in a clockwise direction a
-- 5 by 5 spiral is formed as follows:
--
-- 21 22 23 24 25
-- 20  7  8  9 10
-- 19  6  1  2 11
-- 18  5  4  3 12
-- 17 16 15 14 13
--
-- It can be verified that the sum of the numbers on the diagonals is 101.
-- Corners will be every 1, 3, 5, .. per level, there are 4 counts per level

import Data.List

countByLevel level start 
  | level == 501 = 0
  | level == 0   = 1 + countByLevel (level + 1) 3
  | otherwise    = sum range + countByLevel (level + 1) ((head . reverse $ range ) + next)
    where
      inc   = 2 * level
      next  = 2 * (level + 1)
      range = take 4 [start, (start + inc)..]

main = do
  print $ countByLevel 0 3
