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
    context "For Int (QuickCheck)" $
      it "Holds on: x == fromDigits(toDigits x)" $ do
        property $ \x ->
          x == (fromDigits . toDigits) x
  describe "fromDigits" $ do
    it "Converts a list of digits to a number" $ do
      fromDigits [1..7] `shouldBe` 1234567
      fromDigits [2,4,6,8] `shouldBe` 2468
  describe "doubleEveryOther" $ do
    it "Doubles every other number starting from the right" $ do
      doubleEveryOther [1,2,3,4,5,6] `shouldBe` [2,2,6,4,10,6]
      doubleEveryOther [2,9,4,5,6] `shouldBe` [2,18,4,10,6]
  describe "sumDigits" $ do
    context "When all numbers are less than 10" $
      it "sums the list of integers" $
        sumDigits [1..6] `shouldBe` sum [1..6]
    context "When some numbers are greater than 9" $
      it "sums their digits first before summing the list" $
        sumDigits [2,12,4,14,6,8] `shouldBe` 28
