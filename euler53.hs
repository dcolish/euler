fact n = product [1..n]

choose n r = fact n `div` (fact r * fact (n - r))

cGt1mill = filter(> 10^6) [z | x <- [1..100], y <- [1..100], let z = choose x y]

main = do
  print $ length cGt1mill