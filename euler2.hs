
fib :: [Integer]
fib = 1: 1 : [ i | i <- zip fib(tail fib)]

answer = sum $ takeWhile (<= 4^10*9) $ filter even fib
