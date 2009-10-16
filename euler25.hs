-- What is the first term in the Fibonacci sequence to contain 1000 digits?
--

fibs :: [Integer]
fibs = 1: 1 : [ i | i <- zipWith (+) fibs (tail fibs)]

nL n = ( n , length $ show n)

nTrue (n,l)
    | l < 1000 = True
    | otherwise = False

thDigitFib = (+ 1).length $takeWhile(nTrue) . map (nL) $ fibs


main = print $ thDigitFib

