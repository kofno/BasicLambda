module AWS.Lambda.Context where

import Prelude

import Control.Monad.Eff

foreign import data Context :: *

foreign import data LAMBDA :: !

foreign import succeed :: forall eff. Context -> String -> Eff (lambda :: LAMBDA | eff) Unit

foreign import fail :: forall eff. Context -> String -> Eff (lambda :: LAMBDA | eff) Unit
