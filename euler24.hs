--What is the millionth lexicographic permutation of 
--the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?

import Data.List

foo = sort $ permutations "0123456789"

main = print $ foo !! 999999

