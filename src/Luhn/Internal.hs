module Luhn.Internal
  ( toDigits
  , doubleEveryOther
  , sumDigits
  ) where

toDigits :: Int -> [Int]
toDigits = go []
  where go xs n
          | n <= 0    = xs
          | otherwise = go (m:xs) d  where (d,m) = n `divMod` 10

doubleEveryOther :: [Int] -> [Int]
doubleEveryOther = undefined

sumDigits :: [Int] -> Int
sumDigits = undefined
