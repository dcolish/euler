import Control.Applicative
import Control.Arrow
import Data.Char
import Data.List
import System.Environment


triangle = [t | x <- [1..10^4], let t = (x * (x+1)) `div` 2]

isTriangle x
  | x `elem` triangle = True
  | otherwise = False


inwords = do
  filename <- return "words.txt"
  readFile filename >>= return . sort . g
  where
    g = takeWhile (not.null) . map (filter(isAlpha)) . unfoldr(f)
    f = Just . second(drop 1). break (==',')
    
charScore :: Char -> Int
charScore = (+ 1) . (`mod` 65) . ord

wordScore :: [Char] -> Int
wordScore word = sum $ map (charScore) word

main = do
  innie <- inwords
  print $ length . filter (isTriangle) $ map(wordScore) innie