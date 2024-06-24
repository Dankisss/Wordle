module NormalMode
 where

import Game 
import System.Console.ANSI
import Colourize
import Generator

data NormalGame = NormalGame { targetWord :: String }

instance Game NormalGame where
  initGame = do
    word <- generateWord
    return $ NormalGame word

 --[] --7

normalGame :: NormalGame -> IO ()
runNormalGame :: IO ()

normalGame game = do
  putStrLn "Enter your result: "
  input <- getLine
  let res = guessTheWord input (targetWord game)
  mapM_ printColoured res
  putStrLn $ "\ESC[0m"
  if all (== 'g') res
    then putStrLn "Correct!"
    else do
      putStrLn "Incorrect word! Try again!"
      normalGame game


runNormalGame = do
  game <- initGame
  normalGame game
