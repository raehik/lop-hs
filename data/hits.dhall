let Hit = < R1_1 | R1_2 | R1_3 | tapR2_1 | CR2_1 | CR2_2 >
let TapR2_1 = Hit.tapR2_1

let hit =
      \(id : Text)
   -> \(hit : Hit)
   -> \(mv : Natural)
   -> \(stam : Natural) -- _consume_stamina_ratio
   -> { hit, mv, stam }

in

[ hit "puppet-saber"         R1_1 1000 1000
, hit "wintry-rapier"     TapR2_1 1134 1294
, hit "bramble-curved"      CR2_1 2206 1863 -- damage++ & ratio++++
, hit "bramble-curved"      CR2_2 2145 2123
, hit "city-longspear"    TapR2_1 1484 1574
, hit "city-longspear"      CR2_1 2143 2544
, hit "police-baton"        CR2_1 2034 2167 -- ratio++
, hit "shield-spear"      TapR2_1 1141 2504 -- poor damage, ratio----

, hit "live-puppet-axe"      R1_1 1491 2056 -- ratio--
, hit "live-puppet-axe"   TapR2_1 2027 2101 -- ratio++
, hit "live-puppet-axe"     CR2_1 2988 3761 -- damage++++

, hit "coil-mjolnir"      TapR2_1 1597 2572 -- shitty tap R2, but charge and...
, hit "coil-mjolnir"        CR2_1 2779 3751 -- ...massive damage!

, hit "exploding-pickaxe"   CR2_1 2541 3363 -- combos into CR2_2 quick, but...
, hit "exploding-pickaxe"   CR2_2 2411 3701 -- ...more stamina for less dmg
]

{- See SkillHitInfo.json . Look for _code_name Hit_PC_$weapon_$hit . Hits:
* NA1:       R1 1
* SA1:   tap R2 1
* CA1:      CR2 1
* CA1_1:    CR2 1 hit 1 (of a multihit)
* CA1_2:    CR2 1 hit 2 (of a multihit)
* (below are guesses, haven't properly checked)
* CA1_2:    CR2 1 hit 2 (of a multihit)
* DNA: dodge R1 (dodge normal attack?)
* SNA: dash R1 (sprint normal attack?)
* SSA: dash R2 (sprint strong attack?)

Sometimes, the multihits seem to start without _1.

_impulse_value seems likely to be stagger damage... but it's almost always 8000
or 12000 (for charged attacks). That seems wrong.

In short, any hits where the MV is greater than the stamina usage are "great".

The stamina consumption of a hitbox is

    blade._consume_stamina_point * hit._consume_stamina_ratio

Remember charge attack stamina is reduced by a P-Organ upgrade.
-}
