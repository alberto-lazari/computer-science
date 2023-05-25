data ℕ : Set where
  zero   : ℕ
  succ n : ℕ

data ℚ : Set where
  _/_ : ℕ → ℕ → ℚ
