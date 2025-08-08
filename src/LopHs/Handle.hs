module LopHs.Handle where

import LopHs.Handle.Scaling
import Data.Vector.Unboxed qualified as VU

data ScalingStat = Mot | Tech | Adv

data Scaling = Scaling
  { mot  :: Maybe Grade
  , tech :: Maybe Grade
  , adv  :: Maybe Grade
  }

-- @_have_swing_motion@ and @_have_thrust_motion@ in @ItemInfo.json@
data Motions = Swings | Thrusts | SwingsAndThrusts

data HandleShape = ShortGrip | MidGrip | LongGrip | ShortShaft | LongShaft

data Handle i = Handle
  { weight :: i
  , scaling :: Scaling
  , motions :: Motions
  , shape :: HandleShape
  , guardStaminaReductionRatio :: i
  }

-- level MUST be between 1-99
getScaling :: Num i => ScalingStat -> Int -> Handle i -> i
getScaling stat lvl hdl =
    case statGrade (Handle.scaling hdl) of
      Just grade -> scalingTable VU.! (lvl+lvlMod) * gradeMultFloat grade
      -- ^ TODO need to coerce here. bad anyway, should use ratios
      Nothing    -> 0
  where
    (statGrade, lvlMod) =
        case stat of Mot -> (mot, (-4)); Tech -> (tech, (-4)); Adv -> (adv, 0)
