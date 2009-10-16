-- find the last ten digits of the series,
-- 1^(1) + 2^(2) + 3^(3) + ... + -- 1000^(1000)
--

foo = [ x^x | x <- [1..1000] ]

main = print $ reverse . take 10 . reverse . show $ sum foo
