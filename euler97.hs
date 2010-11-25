bigMuthaPrime = (28433 * 2 ^ 7830457) + 1

main = do
  print $ reverse . take 10 . reverse $ show bigMuthaPrime