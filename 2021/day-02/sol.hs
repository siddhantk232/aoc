module Day02 where

newtype State = State (Int, Int, Int)
  deriving (Show)

data Command = Up Int | Down Int | Forward Int

solve :: State -> Command -> State
solve (State (pos, depth, aim)) (Up val)      = State (pos, depth, aim - val)
solve (State (pos, depth, aim)) (Down val)    = State (pos, depth, aim + val)
solve (State (pos, depth, aim)) (Forward val) = State (pos + val, depth + (aim * val), aim)

parseCommand :: [String] -> Command
parseCommand ["up", n]      = Up (read n)
parseCommand ["down", n]    = Down (read n)
parseCommand ["forward", n] = Forward (read n)
parseCommand n              = undefined

prod :: State -> Int
prod (State(pos, depth, _)) = pos * depth


main = do
  input <- readFile "input.text"
  let commands =  map (parseCommand . words) . lines $ input
  let result = foldl solve (State (0, 0, 0)) commands
  print $ prod result
  

