let Element = < electric | fire | acid >
let Electric = Element.electric
let Fire     = Element.fire
let Acid     = Element.acid
let Damage = { physical : Natural, elemental : Optional { element : Element, damage : Natural } }

let dmgNonElem = \(physDmg : Natural) ->
      { physical = physDmg
      , elemental = None { element : Element, damage : Natural } }

let dmgElem    =
         \(physDmg : Natural) -> \(element : Element) -> \(elemDmg : Natural)
      -> { physical = physDmg
         , elemental = Some { element, damage = elemDmg } }

-- if I change Charge -> Chrge each play rate field is same length...
-- these seem to control attack speed, not _attack_speed in blade
let AnimModifiers =
      { knockbackDistRatio : Natural
      , hitstunDurRatio : Natural
      , animPlayRateIntro : Double -- this is probably P's equip flourish lol
      , animPlayRateCharge : Double
      , animPlayRateSwing : Double
      }

let animMod =
         \(knockbackDistRatio : Natural)
      -> \(hitstunDurRatio : Natural)
      -> \(animPlayRateIntro : Double)
      -> \(animPlayRateCharge : Double)
      -> \(animPlayRateSwing : Double)
      -> { knockbackDistRatio, hitstunDurRatio
         , animPlayRateIntro, animPlayRateCharge, animPlayRateSwing }

-- this is weird, but it feels most Haskell-y to me lol
let PhysSubtype = < slash | strike | pierce >
let Slash  = PhysSubtype.slash
let Strike = PhysSubtype.strike
let Pierce = PhysSubtype.pierce

let MotionAttr  = { physSubtype : PhysSubtype, damageMod : Natural }
let MotionAttrs = { swing : MotionAttr, thrust : MotionAttr }

let motions =
         \(swiPt : PhysSubtype)
      -> \(swiDm : Natural)
      -> \(thrPt : PhysSubtype)
      -> \(thrDm : Natural)
      -> { swing  = { physSubtype = swiPt, damageMod = swiDm }
         , thrust = { physSubtype = thrPt, damageMod = thrDm } }

let blade =
         \(id : Text)
      -> \(internalId : Text)
      -> \(weight : Natural)
      -> \(durability : Natural)
      -> \(guardDamageReductionRatio : Natural)
      -> \(baseStamina : Natural)
      -> \(attackSpeed : Natural) -- unclear what this is for
      -> \(damage : Damage)
      -> \(animModifiers : AnimModifiers)
      -> \(motionAttrs : MotionAttrs)
      -> { id
         , internalId
         , weight
         , durability
         , baseStamina
         , attackSpeed
         , guardDamageReductionRatio
         , damage
         , animModifiers
         , motionAttrs }

in

-- Seems to be the first weapon balanced.
[ blade "puppet-saber"        "Saber"           73 13976 5000 16
    (dmgNonElem 112)
    (animMod 300 1000 1.0        1.0        1.0)
    (motions Slash  10000 Pierce  8000)

-- Fast and low stamina consumption, but awful guard and thrust-only.
, blade "wintry-rapier"       "Rapier"          50 10000 3732 14
    (dmgNonElem  98)
    (animMod 300  858 1.2414103  1.1447142  1.0844718)
    (motions Slash   6000 Pierce 10000)

, blade "greatsword-of-fate"  "Bayonet"        106 10000 6537 20
    (dmgNonElem 121)
    (animMod 330 1153 0.8074514  0.8748785  0.92292976)
    (motions Slash  10000 Pierce 10000)

, blade "bone-cutting"        "GreatSaw"       159  8396 6979 24
    (dmgNonElem 152)
    (animMod 350 1282 0.6766533  0.78339154 0.86374855)
    (motions Slash  10000 Strike  8000)

, blade "bramble-curved"      "Kukri"           74  8396 5032 16
    (dmgNonElem 113)
    (animMod 300 1001 0.99296075 0.9955947  0.99735445)
    (motions Slash  10000 Pierce  8000)

-- Same speed & stamina consumption as Bramble Curved with -10% damage.
, blade "police-baton"        "Baton"           79 10000 5188 16
    (dmgNonElem 104)
    (animMod 330 1032 0.9535247  0.9706943  0.9823121)
    (motions Strike 10000 Strike  8000)

-- Same speed as Electric Coil Stick with slightly lower stamina consumption.
, blade "fire-axe"            "FireAxe"         88 11695 5438 17
    (dmgNonElem 119)
    (animMod 300 1083 0.8865389  0.92749405 0.95584327)
    (motions Slash  10000 Pierce  6000)

-- Great damage for weight & speed.
, blade "master-chef-knife"   "Cleaver"         58 10000 4511 13
    (dmgNonElem 104)
    (animMod 250  917 1.1365231  1.0832692  1.0491604)
    (motions Slash  10000 Pierce  6000)

-- Has crit.
, blade "tyrant-dagger"       "Dagger"          49 10000 3660 13
    (dmgNonElem  93)
    (animMod 250  910 1.2548585  1.152449   1.0888625)
    (motions Slash   8000 Pierce 10000)

, blade "dancers-curved"      "Shamshir"        91 10000 5510 19
    (dmgNonElem 121)
    (animMod 330 1125 0.83572817 0.89390355 0.9349199)
    (motions Slash  10000 Pierce  8000)

, blade "big-wrench"          "ClockworkBlunt" 170 11695 7392 25
    (dmgNonElem 156)
    (animMod 350 1297 0.68369734 0.7884787 0.86710954)
    (motions Strike 10000 Strike  8000)

, blade "electric-coil-stick" "CoilRod"         90 10000 5488 18
    (dmgElem 60 Electric 56)
    (animMod 300 1082 0.8865389  0.92749405 0.95584327)
    (motions Strike 10000 Strike  8000)

-- Shovel

-- Pierce on swing! Anim mods seem wrong, perhaps it got buffed.
, blade "exploding-pickaxe"   "FirePickaxe"    129 10000 5799 22
    (dmgNonElem 132)
    (animMod 300 1333 0.65884405 0.7704406  0.8551523)
    (motions Pierce 10000 Strike  6000)

-- Black Steel Cutter, FlameSword

, blade "shield-spear"        "ShieldSpear"     76  8396 5397 17
    (dmgNonElem 110)
    (animMod 300  980 0.97929955 0.9870115 0.99218655)
    (motions Slash   8000 Pierce 10000)

-- CrystalSpear

-- Hwando (Two Dragons)

-- Seven Sword

-- Glaive

-- RockDrill

-- Halberd

, blade "coil-mjolnir"        "ElectricHammer" 159 10000 7147 25
    (dmgNonElem 157)
    (animMod 300 1351 0.6483753  0.76276636 0.8500313)
    (motions Strike 10000 Strike  6000)

-- ChainScythe

-- CrystalSword

-- SwordLance

-- Notably slow. Beaten by shield spear in most ways.
, blade "city-longspear"      "GreatSpear"     104  8396 5616 21
    (dmgNonElem 110)
    (animMod 300 1098 0.8232657  0.88554883 0.9296672)
    (motions Slash   8000 Pierce 10000)

-- ElectricCutter

-- AcidGreatsword

-- ClockSword

-- CrystalAxe

, blade "salamander-dagger"   "FlameDagger"     66 10000 4555 14
    (dmgElem 53 Fire 46)
    (animMod 300  924 1.0620039  1.0383142  1.0228155)
    (motions Slash  10000 Pierce 10000)

, blade "live-puppet-axe"     "GreatAxe"       188  8396 7756 28
    (dmgNonElem 174)
    (animMod 300 1403 0.6160639  0.7387817  0.83389175)
    (motions Slash  10000 Strike  8000)

-- ScissorSword

-- Charkram (sic)

-- etc... (the boss weapons)

]

{- Comments:
* thrusting weapons are often fast, especially their charge
-}
