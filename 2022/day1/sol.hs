import qualified Data.Text as T

solve :: String -> [Integer]
solve s = groups'
  where
    groups = T.split (\c -> c == '\n') $ T.pack s
    groups' = Prelude.map (\x -> read $ T.unpack x :: Integer) $ Prelude.map (\x -> if x == (T.pack "") then (T.pack "0") else x) groups

main :: IO ()
main = do
  input <- readFile "input.txt"
  let res = solve input
  putStrLn $ show res
