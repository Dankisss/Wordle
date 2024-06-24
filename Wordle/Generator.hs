module Generator 
where

import System.Random 
import System.IO

generateWord :: IO String
wordlist :: IO [String]
getRandomElement :: [a] -> IO a
getWord :: Int -> [String] -> IO String
guessTheWord :: String -> String -> String 

generateWord = do
  putStrLn "Enter a length of the word:"
  line <- getLine
  let num = read line :: Int
  words <- wordlist
  --let words = 
  getWord num words

{-generateWordHelper :: IO String-}

wordlist = do
  stream <- openFile "5000-more-common.txt" ReadMode
  content <- hGetContents stream
  return $ map id (lines content)


getRandomElement xs = do
  index <- randomRIO (0, length xs - 1)
  return (xs !! index)


getWord a xs = getRandomElement $ filter (\x -> length x == a) xs


guessTheWord i t = zipWith helper i t
  where
    helper x y
      | x == y = 'g'
      | elem x t = 'y'
      | otherwise = 'r'
