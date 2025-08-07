module LopHs.Handle where

data Grade = S | A | B | C | D
data ScalingStat = Mot | Tech | Adv

data Scaling = Scaling
  { mot  :: Maybe Grade
  , tech :: Maybe Grade
  , adv  :: Maybe Grade
  }

-- @_have_swing_motion@ and @_have_thrust_motion@ in @ItemInfo.json@
data Motions = Slash | Stab | SlashAndStab

data HandleShape = ShortGrip | MidGrip | LongGrip | ShortShaft | LongShaft

data Handle i = Handle
  { weight :: i
  , guardStaminaReductionRatio :: i
  , attackSpeed :: i
  , guardPoint :: i -- meaning?
  , -- perfectGuardDecEnemyDur always = 45-- assume placeholder, diff for blades
  , scaling :: Scaling
  , motions :: Motions
  , shape :: HandleShape
  }

  , staminaConsumeRatio = 906 -- ItemInfo.json#L51168
  , shapeType = ShortGrip
  , guardStaminaReductionRatio = 4087
  , attackSpeed = 75
  , postureType


--Grade -> Ratio
