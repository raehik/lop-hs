-- | Definitions for assembled weapons (a blade and a handle).
module LopHs.Weapon where

data Weapon i = Weapon
  { bladeInstance :: BladeInstance i
  , handle :: 
  -- TODO handles aren't done much yet, idk how to do cranks
  }
