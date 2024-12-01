import Data.List (transpose, sort)

solve :: String -> [Int]
solve x = 
    [sum diff, sum sim]
    where
        [l1, l2] = map sort $ (transpose $ map ((map read) . words) $ lines x)
        diff = map abs $ zipWith (-) l2 l1
        occ = map (\x -> length $ filter (== x) l2) l1
        sim = zipWith (*) l1 occ

main = interact $ unlines . (map show) . solve
