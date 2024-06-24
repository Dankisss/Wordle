module ExpertMode
where

import Game
import System.Console.ANSI
import Colourize
import Contradictions
import Generator

data ExpertGame = ExpertGame{ targetWord :: String }

instance Game ExpertGame where
    initGame = do       
        word <- generateWord
        return $ ExpertGame word

expertGame :: ExpertGame -> String -> [Bool] -> [String] -> IO()
fakeOutput :: String ->  String -> String -> IO String
runExpertGame :: IO()

expertGame game redLetters chanceForFake history = do
  putStrLn "Enter your result: "
  input <- getLine
  let current = guessTheWord input (targetWord game)
  --mapM_ printColoured current
  if all (== 'g') current
    then do 
        mapM_ printColoured current
        putStrLn $ "\ESC[0m"
        putStrLn "Correct!"
    else if elem input history
        then do
            putStr "Don't try the same word!\n"
            expertGame game redLetters chanceForFake (history ++ [input])
    else do
        fake <- getRandomElement chanceForFake
        if fake == True 
            then do
                fake <- fakeOutput input current redLetters
                mapM_ printColoured fake
                putStrLn $ "\ESC[0m"
                putStrLn "Ooopsie... I LIED!!!"
                expertGame game redLetters [False] (history ++ [input])
        else do
            mapM_ printColoured current
            putStrLn $ "\ESC[0m" 
            putStr "Incorrect word! Try again!"
            expertGame game (addToRed input current redLetters) chanceForFake (history ++ [input])


fakeOutput input result reds = mapM helper $ zip input result
    where
        helper (x, y) 
            | y == 'g' = getRandomElement ['g']
            | y == 'y' = getRandomElement ['g', 'y']
            | y == 'r' = if elem x reds then getRandomElement ['r'] else getRandomElement ['g','y','r']

runExpertGame = do
    game <- initGame
    expertGame game "" [False , True, False, False, False, False, False, False] []
