import Control.Arrow
import Control.Applicative
import Data.Char
import Data.List


names :: IO [[Char]]
names = do
  meh <- return <$> readFile "euler22.in"
  sort. g <$> meh
  where
    g = takeWhile (not.null) . map (filter(isAlpha)) . unfoldr(f)
    f = Just . second(drop 1). break (==',')
    
charScore :: Char -> Int
charScore = (+ 1) . (`mod` 65) . ord

wordScore :: [Char] -> Int
wordScore word = sum $ map (charScore) word

-- Main> let mmm = map(wordScore) <$> names
-- Main> sum . map(\(a,b) -> a * b) <$> zip ([1..5163]) <$> mmm

-- totals :: [a] -> ([Int], [Int])
-- totals = do 
--   len <- length <$> names
--   scores <- map(wordScore) <$> names
--   zip([1..len]) <$> scores
