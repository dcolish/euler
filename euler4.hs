---
-- Find the largest palindrome
-- From the product of two three digit numbers
---

import Data.List

isPalindrome :: Eq a => [a] -> Bool
isPalindrome [] = True
isPalindrome xs
	| xs == reverse xs	= True
	| otherwise			= False

mynums :: Integral a => [a]
mynums = filter ((/= 0). \x -> x `mod` 10) [101..999]

multOver:: Integral a => a -> [a]
multOver n = map (n*) $ mynums

cats :: Integral a => [a] -> [a]
cats ns = concatMap (multOver) $ ns

strNum :: (Show a) => a -> [Char]
strNum n = intersperse ',' $ show n

foo :: Integral a => [a] -> a
foo ns = head . reverse . sort . nub . filter ((== True). \x -> isPalindrome $ strNum x) . cats $ ns

main :: IO()
main = print . foo $ mynums


