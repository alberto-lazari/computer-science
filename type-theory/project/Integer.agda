{-# OPTIONS --allow-unsolved-metas #-}
open import Natural+
  renaming (ℕ⁺ to ℕ)
  renaming (_+_ to _+ₙ_)

module Integer where
  data ℤ : Set where
    zero : ℤ
    pos  : ℕ → ℤ
    neg  : ℕ → ℤ
  
  -_ : ℤ → ℤ
  - zero  = zero
  - pos x = neg x
  - neg x = pos x

  _-ₙ_ : ℕ → ℕ → ℤ
  one    -ₙ one    = zero
  one    -ₙ succ y = neg y
  succ x -ₙ one    = pos x
  succ x -ₙ succ y = x -ₙ y

  _+_ : ℤ → ℤ → ℤ
  zero  + y     = y
  pos x + zero  = pos x
  pos x + pos y = pos (x +ₙ y)
  pos x + neg y = x -ₙ y
  neg x + zero  = neg x
  neg x + pos y = y -ₙ x
  neg x + neg y = neg (x +ₙ y)

  _-_ : ℤ → ℤ → ℤ
  x - y = x + (- y)