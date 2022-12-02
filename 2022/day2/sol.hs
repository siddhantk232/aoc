solve :: String -> Integer
solve s
  | s == "A Y" = 8
  | s == "A X" = 4
  | s == "A Z" = 3
  | s == "B Y" = 5
  | s == "B X" = 1
  | s == "B Z" = 9
  | s == "C Y" = 2
  | s == "C X" = 7
  | s == "C Z" = 6

solve2 :: String -> Integer
solve2 s
  | s == "A Y" = 4
  | s == "A X" = 3
  | s == "A Z" = 8
  | s == "B Y" = 5
  | s == "B X" = 1
  | s == "B Z" = 9
  | s == "C Y" = 6
  | s == "C X" = 2
  | s == "C Z" = 7

main :: IO ()
main = do
  text <- readFile "input.txt"
  let moves = lines text
      scores = map solve moves
      scores' = map solve2 moves
  putStrLn $ show $ sum scores
  putStrLn $ show $ sum scores'
