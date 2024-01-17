module Lab1 where

import Data.List

calculateSum :: [Int] -> Int -> Int -> Int
calculateSum arr from to = sum (take (to - from) (drop from arr))

calculateProduct :: [Int] -> Int -> Int -> Int
calculateProduct arr from to = product (take (to - from) (drop from arr))

main :: IO ()
main = do
    putStrLn "Enter array length: "
    len <- readLn :: IO Int
    putStrLn "Enter array elements separated by spaces: "
    input <- getLine
    let arr = map read (words input) :: [Int]

    putStrLn "Enter first bound: "
    fromIndex <- readLn :: IO Int
    putStrLn "Enter last bound: "
    toIndex <- readLn :: IO Int

    putStrLn "What do you want? (S for sum, P for product, case-sensitive): "
    operation <- getLine

    let result = case operation of
                    "S" -> calculateSum arr fromIndex toIndex
                    "P" -> calculateProduct arr fromIndex toIndex
                    _   -> 0

    putStrLn $ "Results: " ++ show result
