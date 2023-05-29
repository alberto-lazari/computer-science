{-# OPTIONS --allow-unsolved-metas #-}
open import Integer renaming (-_ to -ᵢ_)

module Rational where
  data ℚ : Set where
    _/_ : ℤ → ℤ → ℚ

  infix 5 _≡_
  data _≡_ : ℚ → ℚ → Set where
    refl : {x : ℚ} → x ≡ x

  -_ : ℚ → ℚ
  - (a / b) = (-ᵢ a) / b
