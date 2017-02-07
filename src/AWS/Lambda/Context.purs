module AWS.Lambda.Context where

import Prelude (Unit)
import Control.Monad.Eff (Eff)

foreign import data Context :: *

foreign import data LAMBDA :: !

foreign import succeed :: forall eff. Context -> String -> Eff (lambda :: LAMBDA | eff) Unit

foreign import fail :: forall eff. Context -> String -> Eff (lambda :: LAMBDA | eff) Unit
