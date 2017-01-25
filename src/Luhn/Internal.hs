module Luhn.Internal
  ( toDigits
  , doubleEveryOther
  , sumDigits
  ) where

-- | Returns number digits as a list
toDigits :: Int -> [Int]
toDigits = go []
  where go xs n
          | n <= 0    = xs
          | otherwise = go (m:xs) d  where (d,m) = n `divMod` 10

-- | Double every other digit on the list starting from the right most number
doubleEveryOther :: [Int] -> [Int]
doubleEveryOther = reverse . zipWith (*) (cycle [1,2]) . reverse

-- | Sum all number in the list
-- | If a number is equal or greater than ten if sums its digits first
sumDigits :: [Int] -> Int
sumDigits = undefined
