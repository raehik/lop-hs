module LopHs.Blade where

-- | Physical damage subtype.
data PhysSubtype = Slash | Blunt | Pierce

-- | Damage type. (Doesn't include physical subtype.)
data DamageType = Physical | Elemental Element

-- | Elemental damage types.
data Element = Electric | Fire | Acid

-- | Attributes for a given motion on a given blade.
data MotionAttr i = MotionAttr
  { physSubtype :: PhysSubtype -- | Physical damage subtype.
  , damageMod   :: i           -- | Damage modifier.
  }

data MotionAttrs i = MotionAttrs
  { swingAttrs  :: MotionAttr i
  , thrustAttrs :: MotionAttr i
  }

-- | Blade (base) damage.
data Damage i = Damage
  { physical :: i
  , elemental :: Maybe (Element, i)
  }

-- Note that durability increases the same (so special weapons get less).
-- All attack mods are always updated together (phys + all 3 elems).
data UpgradeType
  = CommonConstant -- +1000,       max +10 (10000)
  | CommonLinear   -- +1000->1175, max +10 (11220)
  | Special        -- +2200,       max + 5 (11000)

data Blade i = Blade
  -- displayed in status menu
  { weight :: i
  , durability :: i
  -- ^ internally tracked by 2 values, for "bad" (25%) and "fine" (100%),
  --   but these are consistent ratios, so I combine
  , guardDamageReductionRatio :: i
  , damage :: Damage i
  , critRate :: i

  -- partially displayed in status menu
  , motionAttrs :: MotionAttrs i
  , upgradeType :: UpgradeType

  -- not displayed in status menu
  , perfectGuardDecEnemyDur :: i
  , attackSpeed :: i -- exists & seems used for both blades and handles!

  -- idk
  , guardPoint :: i -- ???
  }

-- TODO doesn't check for correctness regarding upgrade type (because not worth)
data UpgradeLevel
  = Plus01 | Plus02 | Plus03 | Plus04 | Plus05
  | Plus06 | Plus07 | Plus08 | Plus09 | Plus10

data BladeInstance i = BladeInstance
  { blade :: Blade i
  , upgrade :: Maybe UpgradeLevel
  }
