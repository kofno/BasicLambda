module BasicLambda where

import Prelude

import Control.Monad.Eff
import Data.Foreign
import Data.Foreign.Class
import Data.Either

import AWS.Lambda.Context
import BasicData

handler :: forall eff. Context -> Foreign -> Eff (lambda :: LAMBDA | eff) Unit
handler c d = do
  process $ readData d
  return unit

  where
    readData :: Foreign -> F LambdaData
    readData = read

    process :: F LambdaData -> Eff (lambda :: LAMBDA | eff) Unit
    process (Left err) = fail c $ show err
    process (Right d)  = succeed c $ show d
