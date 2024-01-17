module Main (main) where

data Expr = GCD Expr Expr | Num Int

instance Show Expr where
    show (GCD a b) = "GCD (" ++ show a ++ ") (" ++ show b ++ ")"
    show (Num n) = "Num " ++ show n

eval :: Expr -> Int
eval (GCD a b) = gcd (eval a) (eval b)
eval (Num n) = n

main :: IO ()
main = do
    let expr = GCD (Num 9) (Num 10)
    putStrLn ("Before reduction " ++ show expr)
    let reducedExpr = eval expr
    putStrLn ("After reduction " ++ show reducedExpr)