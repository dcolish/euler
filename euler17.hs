import Control.Applicative
import Data.Char
import Data.Map (Map)
import qualified Data.Map as Map
import Data.Maybe
import Text.Numeral          
import Text.Numeral.Language.EN

lookupInt :: Integer -> Maybe String
lookupInt id = cardinal enLong Neuter id

fullWords = concatMap(prepWord . getWord) [1..1000]
  where
    getWord i 
      |  i < 100 = lookupInt i 
      |  i `mod` 100 > 0 = Just (++ "and") <*> lookupInt i 
      | otherwise = lookupInt i

prepWord (Just s) = filter(isAlpha) s

main = print $ length(fullWords)