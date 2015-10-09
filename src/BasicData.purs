module BasicData where

import Prelude

import Data.Foreign
import Data.Foreign.Class

data LambdaData = LambdaData { key1 :: String
                             , key2 :: String
                             }

instance showLambdaData :: Show LambdaData where
  show (LambdaData o) =
    "LambdaData { key1: " ++ o.key1 ++ ", key2: " ++ o.key2 ++ " }"

instance lambdaDataIsForeign :: IsForeign LambdaData where
  read value = do
    k1 <- readProp "key1" value
    k2 <- readProp "key2" value
    return $ LambdaData { key1: k1, key2: k2 }

