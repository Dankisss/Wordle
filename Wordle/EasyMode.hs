module EasyMode
where

import Game
import System.Console.ANSI
import Colourize
import Contradictions
import Generator

data EasyGame = EasyGame{ targetWord :: String }

instance Game EasyGame where
  initGame = do
    word <- generateWord
    return $ EasyGame word
  
easyGame :: EasyGame -> [String] -> String -> [String] -> IO()
runEasyGame :: IO()

easyGame game history redLetters cur_words = do
  putStrLn "Enter your result: "
  input <- getLine
  let current = guessTheWord input (targetWord game)
  mapM_ printColoured current
  putStrLn $ "\ESC[0m"
  if all (== 'g') current
    then putStrLn "Correct!"
    else do
      putStr $ isElem input cur_words
      printContradictions input current redLetters history
      easyGame game (history ++ [current]) (addToRed input current redLetters) cur_words


runEasyGame = do
    game <- initGame
    words <- wordlist
    easyGame game [] "" words
