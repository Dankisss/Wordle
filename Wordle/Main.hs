import NormalMode
import EasyMode
import ExpertMode
import Colourize
import Contradictions
import System.Console.ANSI

main :: IO()
main = do
    putStrLn "Choose the mode of the game: Normal, Easy, Expert"
    line <- getLine
    if line == "Normal" then runNormalGame 
    else if line == "Easy" then runEasyGame
    else if line == "Expert" then runExpertGame
    else do
        putStrLn "Please try again"
        main


