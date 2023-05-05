-- Bottom set (empty)
data ⊥ : Set where

data ℕ : Set where
  zero : ℕ
  succ : ℕ → ℕ

pred : ℕ → ℕ
pred zero     = zero
pred (succ k) = k

_+_ : ℕ → ℕ → ℕ
zero   + x = x
succ a + b = succ (a + b)

-- EXERCISE: Define (cut-off) subtraction. For instance "succ zero - succ zero"
-- and "succ zero - succ (succ zero)" should both be "zero".
_-_ : ℕ → ℕ → ℕ
zero   - b      = zero
a      - zero   = a
succ a - succ b = a - b

-- EXERCISE: Define multiplication and exponentiation.
_·_ : ℕ → ℕ → ℕ
zero   · b = zero
succ a · b = b + (a · b)

-- EXERCISE: Define the function "half" which divides its input by two.
-- For instance "half (succ (succ (succ (succ zero))))" should be "succ (succ zero)"
-- and "half (succ (succ (succ zero)))" should be "succ zero" (so we round down).
half : ℕ → ℕ
half n = {!!}


data Bool : Set where
  true  : Bool
  false : Bool

¬ : Bool → Bool
¬ true = false
¬ false = true

_∧_ : Bool → Bool → Bool
false ∧ x = false
true  ∧ x = x

_∨_ : Bool → Bool → Bool
true  ∨ x = true
false ∨ x = x

if_then_else_ : {A : Set} → Bool → A → A → A
if true then x else y  = x
if false then x else y = y

_≤_ : ℕ → ℕ → Bool
zero   ≤ b      = true
succ a ≤ zero   = false
succ a ≤ succ b = a ≤ b

_≥_ : ℕ → ℕ → Bool
a      ≥ zero   = true
zero   ≥ succ b = false
succ a ≥ succ b = a ≥ b

_==_ : ℕ → ℕ → Bool
-- a == b = (a ≤ b) ∧ (a ≥ b)
a == b = (a ≤ b) ∧ (b ≤ a)

_eq?_ : ℕ → ℕ → Bool
zero     eq? zero     = true
zero     eq? succ b   = false
(succ a) eq? zero     = false
(succ a) eq? (succ b) = a eq? b

_⇒_ : Bool → Bool → Bool
false ⇒ b = true
true ⇒ b = b

_⇔_ : Bool → Bool → Bool
a ⇔ b = (a ⇒ b) ∧ (b ⇒ a)

is-==-equiv-to-eq? : ℕ → ℕ → Bool
is-==-equiv-to-eq? a b = ((a == b) ⇔ (a eq? b))

-- Testing
z₁ = is-==-equiv-to-eq? zero zero
z₂ = is-==-equiv-to-eq? zero (succ zero)
o₁ = is-==-equiv-to-eq? (succ zero) (succ zero)
o₂ = is-==-equiv-to-eq? (succ zero) (succ (succ zero))
equiv-test = (z₁ ∧ z₂) ∧ (o₁ ∧ o₂)

-- EXERCISE: Implement a function "is-tautology₁?" which checks whether
-- a given input function is constantly true. For instance, if f x = x,
-- then "is-tautology₁ f" should evaluate to "false".
is-tautology₁ : (Bool → Bool) → Bool
is-tautology₁ f = f true ∧ f false

-- EXERCISE: Implement a function "is-tautology₂?" which checks whether
-- a given input function of two arguments is constantly true. For
-- instance, if f x y = true, then "is-tautology₂ f" should evaluate to "true".
is-tautology₂ : (Bool → Bool → Bool) → Bool
is-tautology₂ f = is-tautology₁ (f true) ∧ is-tautology₁ (f false)

even? : ℕ → Bool
even? zero     = true
even? (succ n) = ¬ (even? n)

-- even? : ℕ → Bool
-- even? zero     = true
-- even? (succ n) = if n eq? zero then false else even? n

-- even? : ℕ → Bool
-- even? zero            = true
-- even? (succ zero)     = false
-- even? (succ (succ n)) = even? n
