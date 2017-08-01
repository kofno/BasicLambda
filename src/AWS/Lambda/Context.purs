module AWS.Lambda.Context where

import Prelude (Unit)
import Control.Monad.Eff (kind Effect, Eff)

foreign import data Context :: Type

foreign import data LAMBDA :: Effect

foreign import succeed :: forall eff. Context -> String -> Eff (lambda :: LAMBDA | eff) Unit

foreign import fail :: forall eff. Context -> String -> Eff (lambda :: LAMBDA | eff) Unit
