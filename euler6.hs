--- Project Euler, Problem 6
--

import Data.List

sumsqrs :: Int -> Int
sumsqrs = foldl (+) 0 [ i * i  | i <- [0..100]

sqrsums :: Int -> Int
sqrsums =  ( foldl (+) 0 [0..100] ) ^ 2

sol :: Int -> Int
sol = sqrsums - sumsqrs

main = print sol
