let Element = < Electric | Fire | Acid >
let Damage = { physical : Natural, elemental : Optional { element : Element, damage : Natural } }

let dmgNonElem = \(physicalDmg : Natural) ->
      { physical = physicalDmg
      , elemental = None { element : Element, damage : Natural } }

let AnimModifiers =
      { knockbackDistRatio : Natural
      , hitstunDurRatio : Natural
      , animPlayRateIntro : Double
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
      -> \(damage : Damage)
      -> \(animModifiers : AnimModifiers)
      -> \(staminaConsumeRatio : Natural)
      -> \(motionAttrs : MotionAttrs)
      -> { id
         , internalId
         , weight
         , durability
         , guardDamageReductionRatio
         , damage
         , animModifiers
         , staminaConsumeRatio
         , motionAttrs }

in

[ blade "puppet-saber"       "Saber"     73 13976 5000 (dmgNonElem 112)
    (animMod 300 1000 1.0       1.0       1.0)        1000
    (motions Slash  10000 Pierce  8000)

-- Fast and low stamina consumption, but awful guard and thrust-only.
, blade "wintry-rapier"      "Rapier"    50 10000 3732 (dmgNonElem  98)
    (animMod 300  858 1.2414103  1.1447142  1.0844718)   826
    (motions Slash   6000 Pierce 10000)

, blade "greatsword-of-fate" "Bayonet"  106 10000 6537 (dmgNonElem 121)
    (animMod 330 1153 0.8074514  0.8748785  0.92292976) 1195
    (motions Slash  10000 Pierce 10000)
, blade "bone-cutting"       "GreatSaw" 159  8396 6979 (dmgNonElem 152)
    (animMod 350 1282 0.6766533  0.78339154 0.86374855) 1365
    (motions Slash  10000 Strike  8000)

-- Most values are +1 to Puppet Saber: +0.1 heavier, +1 damage, etc.
, blade "bramble-curved"     "Kukri"     74  8396 5032 (dmgNonElem 113)
    (animMod 300 1001 0.99296075 0.9955947  0.99735445) 1001
    (motions Slash  10000 Pierce  8000)

-- Poor damage for weight.
, blade "police-baton"       "Baton"     79 10000 5188 (dmgNonElem 104)
    (animMod 330 1032 0.9535247  0.9706943  0.9823121)  1040
    (motions Strike 10000 Strike  8000)

, blade "fire-axe"           "FireAxe"   88 11695 5438 (dmgNonElem 119)
    (animMod 300 1083 0.8865389  0.92749405 0.95584327) 1104
    (motions Slash  10000 Pierce  6000)

-- Great damage for weight & speed.
, blade "master-chef-knife"  "Cleaver"   58 10000 4511 (dmgNonElem 104)
    (animMod 250  917 1.1365231  1.0832692  1.0491604)   897
    (motions Slash  10000 Pierce  6000)

, blade "tyrant-dagger"      "Dagger"    49 10000 3660 (dmgNonElem  93)
    (animMod 250  910 1.2548585  1.152449   1.0888625)   888
    (motions Slash   8000 Pierce 10000)

, blade "dancers-curved"     "Shamshir"  91 10000 5510 (dmgNonElem 121)
    (animMod 330 1125 0.83572817 0.89390355 0.9349199)  1159
    (motions Slash  10000 Pierce  8000)
]

{- Comments:
* thrusting weapons are often fast, especially their charge
-}
