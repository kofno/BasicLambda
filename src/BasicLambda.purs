module BasicLambda where

import Prelude

import Control.Monad.Eff
import Data.Foreign
import Data.Foreign.Class

import AWS.Lambda.Context
import BasicData

handler :: forall eff. Context -> Foreign -> Eff (lambda :: LAMBDA | eff) Unit
handler c d = do
  succeed c (show $ readData d)
  return unit

  where
    readData :: Foreign -> F LambdaData
    readData d = read d
