-- Bottom set (empty)
data ⊥ : Set where

data ℕ : Set where
  zero : ℕ
  succ : ℕ → ℕ

pred : ℕ → ℕ
pred zero     = zero
pred (succ k) = k

_+_ : ℕ → ℕ → ℕ
zero + x   = x
succ a + b = succ (a + b)

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


-- Even n is the type of witnesses that n is even.
data Even : ℕ → Set where
  base-even : Even zero
  -- Curly braces means implicit arguements
  step-even : {n : ℕ} → Even n → Even (succ (succ n))

-- Prove a contradition by returning to bottom set
lemma-one-not-even : Even (succ zero) → ⊥
lemma-one-not-even ()

data Odd : ℕ → Set where
  base-odd : Odd (succ zero)
  step-odd : {n : ℕ} → Odd n → Odd (succ (succ n))

-- EXERCISE: Show that the sum of even numbers is even
lemma-sum-even : {a b : ℕ} → Even a → Even b → Even (a + b)
lemma-sum-even base-even b     = b
lemma-sum-even (step-even a) b = step-even (lemma-sum-even a b)

-- EXERCISE: Show that the successor of an even number is odd and vice versa
lemma-succ-even : {a : ℕ} → Even a → Odd (succ a)
lemma-succ-even base-even     = base-odd
lemma-succ-even (step-even a) = step-odd (lemma-succ-even a)

lemma-succ-odd : {a : ℕ} → Odd a → Even (succ a)
lemma-succ-odd base-odd     = step-even base-even
lemma-succ-odd (step-odd a) = step-even (lemma-succ-odd a)

-- EXERCISE: Show that the sum of odd numbers is even
lemma-sum-odd : {a b : ℕ} → Odd a → Odd b → Even (a + b)
lemma-sum-odd base-odd base-odd     = step-even (base-even)
lemma-sum-odd base-odd (step-odd b) = step-even (lemma-sum-odd base-odd b)
lemma-sum-odd (step-odd a) b        = step-even (lemma-sum-odd a b)

-- EXERCISE: Show that the sum of an odd number with an even number is odd
lemma-sum-mixed : {a b : ℕ} → Odd a → Even b → Odd (a + b)
lemma-sum-mixed base-odd base-even     = base-odd
lemma-sum-mixed base-odd (step-even b) = step-odd (lemma-sum-mixed base-odd b)
lemma-sum-mixed (step-odd a) b         = step-odd (lemma-sum-mixed a b)

-- EXERCISE: Show that every number is even or odd.
-- ⊎ = \uplus | \u+
data _⊎_ (A B : Set) : Set where
  left  : A → A ⊎ B
  right : B → A ⊎ B
-- For instance, if x : A, then left x : A ⊎ B.

step-even-odd : {a b : ℕ} → (Even a ⊎ Odd b) → (Even (succ (succ a)) ⊎ Odd (succ (succ b)))
step-even-odd (left a)  = left (step-even a)
step-even-odd (right a) = right (step-odd a)

lemma-even-odd : (a : ℕ) → Even a ⊎ Odd a
lemma-even-odd zero            = left base-even
lemma-even-odd (succ zero)     = right base-odd
lemma-even-odd (succ (succ a)) = step-even-odd (lemma-even-odd a)


-- Lists
data List (A : Set) : Set where
  []  : List A
  _∷_ : A → List A → List A

-- EXERCISE: Define a function which sums the numbers of a given list
sum : List ℕ → ℕ
sum []       = zero
sum (x ∷ xs) = x + sum xs

list = succ zero ∷ (succ (succ zero) ∷ (succ (succ zero) ∷ []))

-- EXERCISE: Define the "map" function.
-- For instance, "map f (x ∷ y ∷ z ∷ []) = f x ∷ f y ∷ f z ∷ []".
map : {A B : Set} → (A → B) → List A → List B
map f []       = []
map f (x ∷ xs) = f x ∷ map f xs
