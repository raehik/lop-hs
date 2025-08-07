let Grade = < s | a | b | c | d >
let B = Grade.b
let C = Grade.c
let E = None Grade

let Scaling =
      { moti : Optional Grade, tech : Optional Grade, adva : Optional Grade }

let scaleMT = \(grM : Grade) -> \(grT : Grade) ->
      { moti = Some grM, tech = Some grT, adva = None Grade }

--let Motion = < swing | thrust >
let Motions = < swings | thrusts | swingsAndThrusts >
let Swings = Motions.swings

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
[ handle "dancers-curved"      "Shamshir" 27 Swings (scaleMT  C B)
, handle "electric-coil-stick" "CoilRod"  27 Swings (scaleMTA C D B)
]
