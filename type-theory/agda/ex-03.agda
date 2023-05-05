-- Bottom set (empty)
data ⊥ : Set where

data ℕ : Set where
  zero : ℕ
  succ : ℕ → ℕ

_+_ : ℕ → ℕ → ℕ
zero   + x = x
succ a + b = succ (a + b)

data Twin : ℕ → ℕ → Set where
  link : {n : ℕ} → Twin n (succ (succ n))

twins : Twin (succ zero) (succ (succ (succ zero)))
-- twins = link {succ zero}
twins = link

not-twins : Twin zero zero → ⊥
-- not-twins = λ ()
not-twins ()

-- Precedence of ≡
infix 5 _≡_
data _≡_ : ℕ → ℕ → Set where
  refl : {n : ℕ} → n ≡ n

lemma₀ : zero ≡ zero
lemma₀ = refl {zero}

lemma₁ : (succ zero + succ zero) ≡ succ (succ zero)
-- lemma₁ = refl {succ zero + succ zero}
-- lemma₁ = refl {succ (succ zero)}
lemma₁ = refl

lemma₂ : {n : ℕ} → (zero + n) ≡ n
lemma₂ = refl

cong : {x y : ℕ} → (f : ℕ → ℕ) → x ≡ y → f x ≡ f y
-- cong f (refl {n}) = refl {f n}
cong f refl = refl

lemma-+-zero : (n : ℕ) → n + zero ≡ n
lemma-+-zero zero = refl
lemma-+-zero (succ n) = cong succ (lemma-+-zero n)
