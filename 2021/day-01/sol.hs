module Day01 where

import Data.List

solve :: (Ord a, Num a) => [a] -> Int
solve xs = length . filter (<0) . zipWith (-) xs $ tail xs

solve2 :: Num a => [a] -> [a]
solve2 xs
  | length xs < 3 = []
  | otherwise = sum (take 3 xs) : solve2 (tail xs)
  
main = do
  input <- readFile "input.text"
  let cleanedIn = map read . lines $ input
  putStr $ show $ solve $ solve2 cleanedIn

