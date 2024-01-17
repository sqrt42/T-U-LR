module Main (main) where

buildNonRecursive :: ((a -> b) -> a -> b) -> (a -> b)
buildNonRecursive f = f (buildNonRecursive f)

main :: IO ()
main = do
    let factorialRecursive recur 0 = 1
        factorialRecursive recur n = n * recur (n - 1)
    
    let factorialNonRecursive = buildNonRecursive factorialRecursive
    
    let result = factorialNonRecursive 4
    putStrLn ("Factorial of 4 is: " ++ show result)