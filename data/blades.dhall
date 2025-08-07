let Element = < Electric | Fire | Acid >

let blade =
         \(id : Text)
      -> \(internal_id : Text)
      -> \(weight : Natural)
      -> \(durability : Natural)
      -> \(guardDamageReductionRatio : Natural)
      -> \(damage : { physical : Natural, elemental : Optional { element : Element, damage : Natural } })
      ->
         { id
         , internal_id
         , weight
         , durability
         , guardDamageReductionRatio
         , damage }

let dmgNonElem = \(physicalDmg : Natural) ->
      { physical = physicalDmg
      , elemental = None { element : Element, damage : Natural } }

in

-- maybe nerfed from 112->100?
[ blade "puppet-saber"   "Saber"  73 13976 5000 (dmgNonElem 112)
, blade "wintry-rapier"  "Rapier" 50 10000 3732 (dmgNonElem  98)
, blade "bramble-curved" "Kukri"  74
, blade "police-baton"   "Baton"  79
]
