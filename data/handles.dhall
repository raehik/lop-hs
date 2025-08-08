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

let Motions = < swings | thrusts | swingsAndThrusts >
let Swings  = Motions.swings
let Thrusts = Motions.thrusts
let SwiThr  = Motions.swingsAndThrusts

let FableArt =
      < concentrate | guardParry | absoluteDefense | endure | furiousSlash
      | strikeChance | quickStab >
let Concentrate     = FableArt.concentrate
let GuardParry      = FableArt.guardParry
let AbsoluteDefense = FableArt.absoluteDefense
let Endure          = FableArt.endure
let FuriousSlash    = FableArt.furiousSlash
let StrikeChance    = FableArt.strikeChance
let QuickStab       = FableArt.quickStab

let handle =
         \(id : Text)
      -> \(internalId : Text)
      -> \(weight : Natural)
      -> \(motions : Motions)
      -> \(scaling : Scaling)
      -> \(fableArt : FableArt)
      -> \(lengthDesc : Text)
      -> \(rate0To99 : Natural)
      -> { id
         , internalId
         , weight
         , scaling
         , motions
         , fableArt }

in

{-
"ratio" refers to hit damage : stamina MVs. 1:1 is a good ratio.
High damage hits tend to have higher stamina consumption e.g. 2:3.
"very short": only a few fingers between top of thumb and top of handle
"short":      about    1/2 hand
"short-med":  about      1 hand
"med-long":   about      3 hands
-}

[ handle "puppet-saber"        "Saber" -- sabre for non-Americans
    18 Swings  (scaleMT  C C) Concentrate
    "very short"
    42
-- Thoroughly unimpressive. I dislike its motions (largely upward swings),
-- its 2-hit CR2 1, its boring (but handy) Fable Art.
-- But lots of great ~1:1 ratios! Not "bad"... but you can do better.

, handle "wintry-rapier"      "Rapier"
    13 Thrusts (scaleMT  D B) GuardParry
    "very short"
    38
-- Nimble! Fast, low end lag, low stamina. Great range on dodge R1. Cool tap R2.
-- Irritating 3-hit CR2, and I personally dislike parry in Lies of P.
-- 100% thrust with unimpressive motion range. Meh.

, handle "greatsword-of-fate" "Bayonet"
    32 SwiThr  (scaleMT  B D) AbsoluteDefense
    "short"
    55
{- Awkward. Short but medium weight, complex moveset mixing swings & thrusts.
CR2 1 is a 2-hit with awful range.
Overall good ratios, and it's an early pluggable Absolute Defense.
Hard to use & won't assemble w/ other blades early, but interesting & handy. -}

, handle "bone-cutting"       "GreatSaw"
    48 Swings  (scaleMT  B D) Endure
    "short-med"
    34
{- Base ~1.3:1.6 ratio. Focus on overheads, but better than other overheads.
The 2.5:3.3 CR2 feels good. (Ignore tap R2 2 in data, unused.)
Alas, a waste of a Fable Art. It's alright. Too many overheads. -}

, handle "bramble-curved"     "Kukri"
    22 Swings  (scaleMT  C C) FuriousSlash
    "short"
    88
{- INSANE CR2 1. 2.2:1.86 ratio on one of the best gap closers in the game.
Dodge R1 is kinda clunky. Otherwise, I pretty much only have praise.
Surprisingly excellent range thanks to the wrist-forward swings and gap closing.
All R2s have great horizontal catch and high ratios (except dash R2, high stam).
R1s are sensible, though the first hit is higher stamina. Fast, fluid combos.
And it already comes with the ideal scaling, C/C.
Simply incredible. Fine with original blade, amazing with heavier & longer. -}

, handle "police-baton"       "Baton"
    20 Swings  (scaleMT  B D) StrikeChance
    "very-short"
    64
{- 2.034:2.167 CR2, with Strike Chance for a +80% buff lmao. Other ratios med.
Atrocious motions/reach due to strike "stop" (no follow-through).
Entirely carried by its Fable Art and CR2. But serious, serious damage. -}

, handle "fire-axe"            "FireAxe"
    26 Swings  (scaleMT  C C) Endure
    "med-long"
    58
{- Med damage & ratios with somewhat expensive R2s.
Solid R1s, 1->2 is fast (2->1 bit slower). Tap R2 is nice, but expensive.
CR2 is slow but 2.1:3.2 with excellent gap close. Boring useless Fable Art.
Length wins me over. Little limited, but solid midweight swing handle. -}

, handle "master-chef-knife"   "Cleaver"
    12 Swings  (scaleMT  D B) FuriousSlash
    "very-short"
    48
{- Low damage, good ratios. 2nd hits are slightly weaker with way lower stamina:
R1 1->2 is 0.887:0.722 -> 0.839:0.566 ; tap R2 1->2 is 1.3:1.8 -> 1.1->1.3!
CR2 is 3-hit but fast & strong, effectively 2.2:2.2.
Motions are very stationary. Bread and butter is R1s + CR2.
Great , but can't figure out how best to use. Long sword handles, perhaps? -}

, handle "tyrant-dagger"       "Dagger"
    10 Thrusts (scaleMT  D B) QuickStab
    "very-short"
    46
{- Multi-hits in R1 3 and CR2, sensible for crit consistency.
I prefer heavy high-range thrusts over fast short, but it's admittedly fine. -}

{-
, handle "dancers-curved"      "Shamshir"
    27 Swings  (scaleMT  C B) GuardParry
-}
{- Best scaling non-DLC, non-elemental assembly handle (C/B/-).
TODO really cool swings
-}

{-
, handle "electric-coil-stick" "CoilRod"
    27 Swings  (scaleMTA C D B)
, handle "acid-spear"          "CrystalSpear"
    26 Thrusts (scaleMTA D D A)
, handle "black-steel-cutter"  "FlameSword"
    31 Swings  (scaleMTA D D A)
, handle "acid-curved-sword"   "AcidGreatsword"
    39 Swings  (scaleMTA D C B)
, handle "carcass-crystal-axe" "CrystalAxe"
    36 Swings  (scaleMTA C D B)
, handle "electric-chainsaw"   "ElectricCutter"
    53 Swings  (scaleMTA D D A)
, handle "salamander-dagger"   "FlameDagger"
    13 SwiThr  (scaleMTA D C B)
-}

]
