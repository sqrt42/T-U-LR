module Main (main) where

main :: IO ()
main = do {
    print (multiTwo 1 2)
}

multiFive::Num a=>a->(a->(a->(a->(a->a))))
multiFive a b c d e = a * b * c * d * e

multiFour :: Num a => a -> a -> a -> a -> a
multiFour = multiFive 4

multiThree :: Num a => a -> a -> a -> a
multiThree = multiFive 2 3 

multiTwo :: Num a => a -> a -> a
multiTwo = multiFive 2 3 4

multiOne :: Num a => a -> a
multiOne = multiFive 6 7 8 9