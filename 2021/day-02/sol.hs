module Day02 where

newtype State = State (Int, Int)
  deriving (Show)

data Command = Up Int | Down Int | Forward Int

solve :: State -> Command -> State
solve (State (pos, depth)) (Up val)      = State (pos, depth - val)
solve (State (pos, depth)) (Down val)    = State (pos, depth + val)
solve (State (pos, depth)) (Forward val) = State (pos + val, depth)

parseCommand :: [String] -> Command
parseCommand ["up", n]      = Up (read n)
parseCommand ["down", n]    = Down (read n)
parseCommand ["forward", n] = Forward (read n)
parseCommand n              = undefined

prod :: State -> Int
prod (State(pos, depth)) = pos * depth


main = do
  input <- readFile "input.text"
  let commands =  map (parseCommand . words) . lines $ input
  let result = foldl solve (State (0, 0)) commands
  print $ prod result
  

