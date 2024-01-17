module Main (main) where

import Data.IORef

updateCounter reference = do 

  let increment :: IO()
      increment = do
        modifyIORef' reference (+1)
  increment
  return reference

main :: IO ()
main = do
  ref <- newIORef(0::Int)
  counter <- updateCounter ref
  counter <- updateCounter ref
  counter <- updateCounter ref
  counter <- updateCounter ref
  counter <- updateCounter ref
  counter <- updateCounter ref
  count <- readIORef counter
  putStrLn $ "The function has been called " ++ show count ++ " times"