data MyNat
  = MZ
  | MS MyNat



implementation Show MyNat where
  show = show . unMy

main : IO ()
main = print million
