module Colourize
where

--import System.Console.ANSI

colourize :: String -> Char -> String
red :: Char -> String
green :: Char -> String
yellow :: Char -> String
printColoured :: Char -> IO ()

colourize colorCode sym = "\x1b[" ++ colorCode ++ "m" ++ [sym] 

red = colourize "31"

green = colourize "32"

yellow = colourize "33"

printColoured 'r' = putStr $ red 'r'
printColoured 'g' = putStr $ green 'g'
printColoured 'y' = putStr $ yellow 'y'