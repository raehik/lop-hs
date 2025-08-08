let Grade = < s | a | b | c | d >
let S = Grade.s
let A = Grade.a
let B = Grade.b
let C = Grade.c
let D = Grade.d
let E = None Grade

let Scaling =
      { moti : Optional Grade, tech : Optional Grade, adva : Optional Grade }

let scaleMT  = \(grM : Grade) -> \(grT : Grade) ->
      { moti = Some grM, tech = Some grT, adva = None Grade }

let scaleMTA = \(grM : Grade) -> \(grT : Grade) -> \(grA : Grade) ->
      { moti = Some grM, tech = Some grT, adva = Some grA }

--let Motion = < swing | thrust >
let Motions = < swings | thrusts | swingsAndThrusts >
let Swings  = Motions.swings
let Thrusts = Motions.thrusts
let SwiThr  = Motions.swingsAndThrusts

let handle =
         \(id : Text)
      -> \(internalId : Text)
      -> \(weight : Natural)
      -> \(motions : Motions)
      -> \(scaling : Scaling)
      -> { id
         , internalId
         , weight
         , scaling
         , motions }

in

-- Best scaling non-DLC, non-elemental assembly handle (C/B/-).
[ handle "dancers-curved"      "Shamshir"       27 Swings  (scaleMT  C B)

, handle "electric-coil-stick" "CoilRod"        27 Swings  (scaleMTA C D B)
, handle "acid-spear"          "CrystalSpear"   26 Thrusts (scaleMTA D D A)
, handle "black-steel-cutter"  "FlameSword"     31 Swings  (scaleMTA D D A)
, handle "acid-curved-sword"   "AcidGreatsword" 39 Swings  (scaleMTA D C B)
, handle "carcass-crystal-axe" "CrystalAxe"     36 Swings  (scaleMTA C D B)
, handle "electric-chainsaw"   "ElectricCutter" 53 Swings  (scaleMTA D D A)
, handle "salamander-dagger"   "FlameDagger"    13 SwiThr  (scaleMTA D C B)
]
