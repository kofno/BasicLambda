module BasicLambda where

import Prelude (Unit, unit, pure, bind, show, ($))

import Control.Monad.Eff (Eff)
import Data.Foreign (F, Foreign)
import Data.Foreign.Class (read)
import Data.Either (Either(..))

import AWS.Lambda.Context (LAMBDA, Context, succeed, fail)
import BasicData (LambdaData)

handler :: forall eff. Context -> Foreign -> Eff (lambda :: LAMBDA | eff) Unit
handler c d = do
  process $ readData d
  pure unit

  where
    readData :: Foreign -> F LambdaData
    readData = read

    process :: F LambdaData -> Eff (lambda :: LAMBDA | eff) Unit
    process (Left err) = fail c $ show err
    process (Right d)  = succeed c $ show d
