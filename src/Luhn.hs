module Luhn
  ( validate
  ) where

import Luhn.Internal

validate :: Int -> Bool
validate = (== 0) . (`mod` 10) . sumDigits . doubleEveryOther . toDigits
