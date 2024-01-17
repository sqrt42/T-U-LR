module Main (main) where

data Expr = AddOne Expr | Num Int

instance Show Expr where
    show (AddOne e) = "AddOne (" ++ show e ++ ")"
    show (Num n) = "Num " ++ show n

eval :: Expr -> Int
eval (AddOne e) = eval e + 1
eval (Num n) = n

main :: IO ()
main = do
    let expr = AddOne (AddOne (Num 3))
    putStrLn ("Before reduction: " ++ show expr)
    let reducedExpr = eval expr
    putStrLn ("After reduction: " ++ show reducedExpr)