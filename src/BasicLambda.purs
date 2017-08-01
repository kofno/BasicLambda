module BasicLambda where

import Prelude (class Show, (<>), (>>=), Unit, unit, pure, bind, show, ($), discard)

import Control.Monad.Eff (Eff)
import Control.Monad.Except (runExcept)
import Data.Foreign (F, Foreign, readString)
import Data.Foreign.Index ((!))
import Data.Either (Either(..))

import AWS.Lambda.Context (LAMBDA, Context, succeed, fail)

newtype LambdaData = LambdaData { key1 :: String
                                , key2 :: String
                                }

instance showLambdaData :: Show LambdaData where
  show (LambdaData o) =
    "LambdaData { key1: " <> o.key1 <> ", key2: " <> o.key2 <> " }"

handler :: forall eff. Context -> Foreign -> Eff (lambda :: LAMBDA | eff) Unit
handler c d = do
  process $ runExcept $ readData d
  pure unit

  where
    readData :: Foreign -> F LambdaData
    readData value = do
        key1 <- value ! "key1" >>= readString
        key2 <- value ! "key2" >>= readString
        pure $ LambdaData { key1, key2 }

    -- Looks like this signature doesn't match but it works without it
    -- process :: F LambdaData -> Eff (lambda :: LAMBDA | eff) Unit
    process (Left err) = fail c $ show err
    process (Right d') = succeed c $ show d'
