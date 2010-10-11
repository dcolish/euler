import Control.Applicative
import Data.List
import Data.Maybe
import System.Environment

rows :: IO [[Int]]
rows = do
  f <- head <$> getArgs
  readFile f >>= return . processFile
    where
      processFile = filter(/= []) . intifyRows . lines
      intifyRows = map(map(read)) . map(words)

res = do
  q <- rows
  return . head $ foldr1 g q
  where
    f x y z = x + max y z
    g xs ys = zipWith3 f xs ys $ tail ys



main = do 
  solution <- res
  print $ solution