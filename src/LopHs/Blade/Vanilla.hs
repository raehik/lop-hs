-- | Vanilla blade definitions.
module LopHs.Blade.Vanilla where

-- | Shortcut for defining motion attributes, in order "swing" then "thrust".
masSwingThrust :: Num i => PhysSubtype -> i -> PhysSubtype -> i -> MotionAttrs i
masSwingThrust pt1 dm1 pt2 dm2 = MotionAttrs
  { swingAttrs  = MotionAttr { physSubtype = pt1, damageMod = dm1 }
  , thrustAttrs = MotionAttr { physSubtype = pt2, damageMod = dm2 }
  }

-- | Common motion attributes for blades with a point and cutting edge.
masCommonPointedEdgedBlade :: Num i => MotionAttrs i
masCommonPointedEdgedBlade = masSwingThrust Slash 10000 Pierce 10000

-- "FireDagger" internally
bSalamanderDagger :: Num i => Blade i
bSalamanderDagger = Blade
  { weight = 66
  }

-- "Kukri" internally
bBramble :: Num i => Blade i
bBramble = Blade
  { weight = _
  , perfectGuardDecEnemyDur = 50
  }

bShovel :: Num i => Blade i
bShovel = Blade
  { weight = _
  , guardPoint = 68
  , perfectGuardDecEnemyDur = 58
  , attackSpeed = 28
  , motionAttrSwing  = MotionAttr { physSubtype = Slash,  damageMod = 10000 }
  , motionAttrThrust = MotionAttr { physSubtype = Slash,  damageMod = 10000 }
  }

bBaton :: Num i => Blade i
bBaton = Blade
  { weight = _
  , guardPoint = 54
  , perfectGuardDecEnemyDur = 52
  , attackSpeed = 28
  , motionAttrSwing  = MotionAttr { physSubtype = Strike, damageMod = 10000 }
  , motionAttrThrust = MotionAttr { physSubtype = Strike, damageMod =  8000 }
  }

bBlackSteelCutter :: Num i => Blade i
bBlackSteelCutter = Blade
  { weight = _
  , guardDamageReductionRatio = 5867
  , guardPoint = _
  , perfectGuardDecEnemyDur = 59
  , attackSpeed = 25
  , motionAttrSwing  = MotionAttr { physSubtype = Slash,  damageMod = 10000 }
  , motionAttrThrust = MotionAttr { physSubtype = Strike, damageMod =  6000 }
  }

bDancersCurved :: Num i => Blade i
bDancersCurved = Blade
  { weight = _
  , guardDamageReductionRatio = 5510
  , guardPoint = 48
  , perfectGuardDecEnemyDur = 55
  , attackSpeed = 21
  , motionAttrSwing  = MotionAttr { physSubtype = Slash,  damageMod = 10000 }
  , motionAttrThrust = MotionAttr { physSubtype = Pierce, damageMod =  8000 }
  }

bWintryRapier :: Num i => Blade i
bWintryRapier = Blade
  { weight = _
  , guardDamageReductionRatio = 3732
  , guardPoint = 26
  , perfectGuardDecEnemyDur = 55
  , attackSpeed = 21
  , motionAttrSwing  = MotionAttr { physSubtype = Slash,  damageMod = 10000 }
  , motionAttrThrust = MotionAttr { physSubtype = Pierce, damageMod =  8000 }
  }

-- "Cleaver" internally
bMasterChef :: Num i => Blade i
bMasterChef = Blade
  { weight = 58
  , durability = 10000
  , guardDamageReductionRatio = 4511
  , guardPoint = 48
  , perfectGuardDecEnemyDur = 45
  , attackSpeed = 25
  , motionAttrs = masSwingThrust Slash 10000 Pierce 6000
  }
