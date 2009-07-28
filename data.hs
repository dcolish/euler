data Possibly a = Some a | None
	--deriving Show

instance Show a => Show (Possibly a ) where
	show None = "<>"
	show (Some a) = "<" ++ show a ++ ">"

x:: Possibly Int
x = Some 3


inc :: Possibly Int -> Possibly Int
inc (Some x) = Some (x + 1)
int None = None

dec :: (Bounded a, Enum a, Eq a) => Possibly a -> Possibly a
dec (Some x)
	| x == minBound = None
	| otherwise = Some (pred x)
--dec None = None
