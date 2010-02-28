-- 
-- The number, 197, is called a circular prime because all rotations of the
-- digits: 197, 971, and 719, are themselves prime.
--
-- There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71,
-- 73, 79, and 97.
--
-- How many circular primes are there below one million?
--

import Data.List

data People a = VIP a (People a) | Crowd [a]

mergeP :: Ord a => People a -> People a -> People a
mergeP (VIP x xt) ys                    = VIP x $ mergeP xt ys
mergeP (Crowd xs) (Crowd ys)            = Crowd $ merge  xs ys
mergeP xs@(Crowd ~(x:xt)) ys@(VIP y yt) = case compare x y of
    LT -> VIP x $ mergeP (Crowd xt) ys
    EQ -> VIP x $ mergeP (Crowd xt) yt
    GT -> VIP y $ mergeP xs yt


merge :: Ord a => [a] -> [a] -> [a]
merge xs@(x:xt) ys@(y:yt) = case compare x y of
    LT -> x : merge xt ys
    EQ -> x : merge xt yt
    GT -> y : merge xs yt

diff xs@(x:xt) ys@(y:yt) = case compare x y of
    LT -> x : diff xt ys
    EQ ->     diff xt yt
    GT ->     diff xs yt

foldTree :: (a -> a -> a) -> [a] -> a
foldTree f ~(x:xs) = f x . foldTree f . pairs $ xs
    where pairs ~(x: ~(y:ys)) = f x y : pairs ys

primes, nonprimes :: [Integer]
primes    = 2:3:diff [5,7..] nonprimes
nonprimes = serve . foldTree mergeP . map multiples $ tail primes
    where
    multiples p = vip [p*k | k <- [p,p+2..]]
    vip (x:xs)       = VIP x $ Crowd xs
    serve (VIP x xs) = x:serve xs
    serve (Crowd xs) = xs

nlist ::  Integer -> [Integer]
nlist = unfoldr (\x -> if x == 0 then Nothing else Just( x `mod` 10, x `div` 10))

unlist :: [Integer] -> Integer
unlist [] = 0
unlist [n] = n
unlist (n:ns)
        | n /= 0 = ((10 ^ (length ns)) * n) + unlist ns
        | otherwise = (10 ^ (length ns)) + unlist ns

foo :: Integer -> [Integer]
foo n = map(unlist) $ permutations $ nlist n

moo = sum $ [x | x <- primes, x < 1000000]

circPrime = foo

--final = filter(circPrime) $ moo


