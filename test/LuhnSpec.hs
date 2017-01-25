module LuhnSpec (main, spec) where

import Test.Hspec
import Test.QuickCheck

import Luhn
import Luhn.Internal

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "toDigits" $ do
    it "Converts a number to a list of digits" $ do
      toDigits 1234567 `shouldBe` [1,2,3,4,5,6,7]
      toDigits 2468 `shouldBe` [2,4,6,8]
  describe "doubleEveryOther" $ do
    it "doubles every other number starting from the right" $ do
      doubleEveryOther [1,2,3,4,5,6] `shouldBe` [2,2,6,4,10,6]
      doubleEveryOther [2,9,4,5,6] `shouldBe` [2,18,4,10,6]
