module Contradictions
where

import Data.List

printContradictions :: String -> String -> String -> [String] -> IO()
isElem :: String -> [String] -> String
addToRed :: String -> String -> String -> String
checkRed :: String -> String -> Bool
printCheckRed :: String -> String -> String
checkYellow :: [String] -> String -> Bool
printCheckYellow :: [String] -> String -> String
checkGreen :: [String] -> String -> Bool
printCheckGreen :: [String] -> String -> String

printContradictions input result reds history = do
    putStr $ printCheckRed input reds
    putStr $ printCheckYellow history result
    putStr $ printCheckGreen history result

isElem str xs
    | elem str xs = ""
    | otherwise = "The word is not in the wordlist! Try another word!\n"

addToRed input result current = nub $ current ++ ( map (\ (x,y) -> x) $ filter (\ (x,y) -> y == 'r') $ zip input result )

checkRed input reds = any (\x -> elem x reds) input 

printCheckRed input reds
    | checkRed input reds = "You wrote letters that you know they are not in the target word!\n"
    | otherwise = ""

checkYellow [] _ = False
checkYellow xs x = any helper xs
    where
        helper a = any (\ (x, y) -> x == 'y' && y == 'r') $ zip a x

printCheckYellow xs str
    | checkYellow xs str = "You didn't write letters that are yellow!\n"
    | otherwise = ""

checkGreen [] _ = False
checkGreen xs word = any helper xs
    where
        helper a = any (\ (x, y) -> x == 'g' && x /= y) $ zip a word

printCheckGreen xs str
    | checkGreen xs str = "You didn't write letters that are green!\n"
    | otherwise = ""

