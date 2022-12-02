-- by: ebn (discord: ebn#5589)
import Data.Monoid

part2 :: String -> String
part2 = show . getSum . foldMap score . lines
  where
    score x = Sum $ case x of
      "A X" -> 3
      "B X" -> 1
      "C X" -> 2
      "A Y" -> 4
      "B Y" -> 5
      "C Y" -> 6
      "A Z" -> 8
      "B Z" -> 9
      "C Z" -> 7
      _ -> 0

main = interact part2
