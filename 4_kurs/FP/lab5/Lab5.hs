module Main (main) where

main :: IO ()
main = do askLessQuestions 0 1000
intToString :: Int -> String
intToString n = show n

askLessQuestions :: Int->Int->IO ()
askLessQuestions min max = do{
    putStrLn ("Less than " ++ intToString ((min+max)`div`2));
    line <- getLine;
    if line == "n"
        then
            askLessQuestions ((min+max)`div`2) max;
    else if line == "y"
        then
            askMoreQuestions min ((min+max)`div`2);
    else 
        putStrLn ("Since you can only enter y or n, I'll assume I guessed right. How in the blood-soaked Protestant hell did I do that?");
}

askMoreQuestions :: Int->Int->IO ()
askMoreQuestions min max = do{
    putStrLn ("More than " ++ intToString ((min+max)`div`2));
    line <- getLine;
    if line == "y"
        then
            askMoreQuestions ((min+max)`div`2) max ;
    else if line == "n"
        then
            askLessQuestions min ((min+max)`div`2);
    else
        putStrLn ("Since you can only enter y or n, I'll assume I guessed right. How in the blood-soaked Protestant hell did I do that?"); 
}