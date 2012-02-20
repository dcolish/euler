-- Totally stumped on this one

-- This is brilliant from the haskell wiki
-- http://www.haskell.org/haskellwiki/Blow_your_mind

-- The initial row is [1], iterate the applies the row function which applies +
-- to all members for the two row lists then zips the lists together
pascal = iterate (\row -> zipWith (+) ([0] ++ row) (row ++ [0])) [1]

main = print $ pascal !! 40 !! 20