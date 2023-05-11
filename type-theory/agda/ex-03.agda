data Bool : Set where
  false true : Bool

data ℕ : Set where
  zero : ℕ
  succ : ℕ → ℕ

data ⊥ : Set where

data _⊎_ (A B : Set) : Set where
  left  : A → A ⊎ B
  right : B → A ⊎ B

¬ : Set → Set
¬ X = X → ⊥

! : Bool → Bool
! false = true
! true  = false

_+_ : ℕ → ℕ → ℕ
zero   + b = b
succ a + b = succ (a + b)

_·_ : ℕ → ℕ → ℕ
zero   · b = zero
succ a · b = b + (a · b)

pred : ℕ → ℕ
pred zero     = zero
pred (succ a) = a

-- Precedence of ≡ₙₙ
infix 5 _≡ₙ_
data _≡ₙ_ : ℕ → ℕ → Set where
  refl : {n : ℕ} → n ≡ₙ n


data Twin : ℕ → ℕ → Set where
  link : {n : ℕ} → Twin n (succ (succ n))

twins : Twin (succ zero) (succ (succ (succ zero)))
-- twins = link {succ zero}
twins = link

not-twins : Twin zero zero → ⊥
-- not-twins = λ ()
not-twins ()

lemma₀ : zero ≡ₙ zero
lemma₀ = refl {zero}

lemma₁ : (succ zero + succ zero) ≡ₙ succ (succ zero)
-- lemma₁ = refl {succ zero + succ zero}
-- lemma₁ = refl {succ (succ zero)}
lemma₁ = refl

lemma₂ : {n : ℕ} → (zero + n) ≡ₙ n
lemma₂ = refl

congₙ : {x y : ℕ} → (f : ℕ → ℕ) → x ≡ₙ y → f x ≡ₙ f y
-- congₙ f (refl {n}) = refl {f n}
congₙ f refl = refl

infix 5 _≡_
data _≡_ {X : Set} : X → X → Set where
  refl : {a : X} → a ≡ a

{-# BUILTIN EQUALITY _≡_ #-}


------------------------------------
----[ LOGICAL TAUTOLOGIES ]---------
------------------------------------

dni : {A : Set} → A → ¬ (¬ A)
dni p a = a p

contraposition : {A B : Set} → (A → B) → (¬ B → ¬ A)
contraposition f p a = p (f a)

de-morgan₁ : {A B : Set} → ¬ (A ⊎ B) → ¬ A
de-morgan₁ p a = p (left a)

de-morgan₂ : {A B : Set} → ¬ (A ⊎ B) → ¬ B
de-morgan₂ p b = p (right b)


------------------------------------
----[ GENERALITIES ON EQUALITY ]----
------------------------------------

-- EXERCISE: Fill in this hole, thereby proving that equality is a "congruence";
-- by this lemma, we can apply the same operation to the two sides of an equation
-- and still be sure that the equation holds.
cong : {A B : Set} {x y : A} → (f : A → B) → x ≡ y → f x ≡ f y
cong f refl = refl

-- EXERCISE: Prove that equality is symmetric.
symm : {A : Set} {x y : A} → x ≡ y → y ≡ x
symm refl = refl

-- EXERCISE: Fill in this hole, thereby proving that equality is transitive.
trans : {A : Set} {x y z : A} → x ≡ y → y ≡ z → x ≡ z
trans refl refl = refl

-- EXERCISE: Prove that equal functions have equal values. (The
-- converse is a principle known as "function extensionality" which
-- can be postulated in Agda but is not assumed by default.)
equal→pwequal : {A B : Set} {f g : A → B} {x : A} → f ≡ g → f x ≡ g x
equal→pwequal refl = refl

-- EXERCISE: Think about the expression "(⊥ ≡ ℕ)". Is it well-defined?
-- What would be its meaning?

-- EXERCISE: Fill in this hole. This lemma will be used below
-- in the proof that the double of any number is even.
transport : {A : Set} {x y : A} → (F : A → Set) → x ≡ y → F x → F y
transport F refl s = s


---------------------------------
----[ EQUALITIES OF NUMBERS ]----
---------------------------------

-- EXERCISE: Show that the predecessor of the successor of a number is that number again.
lemma-pred-succ : (a : ℕ) → pred (succ a) ≡ a
lemma-pred-succ a = refl

-- EXERCISE: Show that the two functions "even?" and "even?'" have the same values.
even? : ℕ → Bool
even? zero     = true
even? (succ n) = ! (even? n)

even?' : ℕ → Bool
even?' zero            = true
even?' (succ zero)     = false
even?' (succ (succ n)) = even?' n

lemma-!-! : {a : Bool} → ! (! a) ≡ a
lemma-!-! {false} = refl
lemma-!-! {true}  = refl

lemma-even?-even?'₁ : (a : ℕ) → even? a ≡ even?' a
lemma-even?-even?'₁ zero            = refl
lemma-even?-even?'₁ (succ zero)     = refl
lemma-even?-even?'₁ (succ (succ a)) = trans (lemma-!-!) (lemma-even?-even?'₁ a)

lemma-even?-even?'₂ : (a : ℕ) → even? a ≡ even?' a
lemma-even?-even?'₂ zero            = refl
lemma-even?-even?'₂ (succ zero)     = refl
lemma-even?-even?'₂ (succ (succ a)) with even? a with lemma-even?-even?'₂ a
... | false | rec = rec
... | true  | rec = rec

-- EQUATIONAL REASONING
-- From ex-04, for lemma-even?-even?'₃

infix  3 _∎
infixr 2 _≡⟨_⟩_ _≡⟨⟩_
infix  1 begin_

_≡⟨_⟩_ : {A : Set} {y z : A} → (x : A) → x ≡ y → y ≡ z → x ≡ z
x ≡⟨ p ⟩ q = trans p q

_≡⟨⟩_ : {A : Set} {y : A} → (x : A) → (q : x ≡ y) → x ≡ y
x ≡⟨⟩ q = q

-- ∎ = \qed
_∎ : {A : Set} → (x : A) → x ≡ x
x ∎ = refl

begin_ : {A : Set} {x y : A} → x ≡ y → x ≡ y
begin p = p

lemma-even?-even?'₃ : (a : ℕ) → even? a ≡ even?' a
lemma-even?-even?'₃ zero            = refl
lemma-even?-even?'₃ (succ zero)     = refl
lemma-even?-even?'₃ (succ (succ a)) = begin
  even? (succ (succ a))  ≡⟨⟩
  ! (even? (succ a))     ≡⟨⟩
  ! (! (even? a))        ≡⟨ lemma-!-! ⟩
  even? a                ≡⟨ lemma-even?-even?'₃ a ⟩
  even?' a               ≡⟨⟩
  even?' (succ (succ a)) ∎

zero-≠-one : succ zero ≡ zero → ⊥
zero-≠-one ()

-- EXERCISE: Show that it is not the case that "succ (pred a) ≡ a" for all natural numbers a.
lemma-succ-pred : ((a : ℕ) → succ (pred a) ≡ a) → ⊥
lemma-succ-pred f = zero-≠-one (f zero)
{-
lemma-succ-pred f with f zero
...                  | ()
-}

-- The following defines a type family "Positive : ℕ → Set" such that "Positive a" is the
-- type of witnesses that a is positive: The type "Positive zero" is empty
-- and the types "Positive (succ n)" are inhabited for every n.
data Positive : ℕ → Set where
  -- on purpose, we do NOT include this constructor: zero-is-positive : Positive zero
  succs-are-positive : {n : ℕ} → Positive (succ n)

-- EXERCISE: Fill in this hole.
lemma-succ-pred' : (a : ℕ) → Positive a → succ (pred a) ≡ a
lemma-succ-pred' a succs-are-positive = refl

-- EXERCISE: Verify the following two auxiliary lemmas, establishing that we
-- could have equivalently defined addition also by recursion on the second argument.
lemma-+-zero : (n : ℕ) → n + zero ≡ n
lemma-+-zero zero     = refl
lemma-+-zero (succ n) = cong succ (lemma-+-zero n)

lemma-+-succ : (a b : ℕ) → (a + succ b) ≡ succ (a + b)
lemma-+-succ zero     b = refl
lemma-+-succ (succ a) b = cong succ (lemma-+-succ a b)

-- EXERCISE: Verify that addition is commutative.
{-
Goal: a + succ b = succ (b + a)

lemma-succ a b: a + succ b = succ (a + b)
lemma-succ b a: b + succ a = succ (b + a)

lemma-commutative a b: a + b = b + a
cong succ (lemma-commutative a b): succ (a + b) = succ (b + a)

=> trans (lemma-succ a b) (cong succ (lemma-commutative a b))
=> trans (a + succ b = succ (a + b)) (succ (a + b) = succ (b + a)): a + succ b = succ (b + a)
-}
lemma-+-commutative : (a b : ℕ) → (a + b) ≡ (b + a)
lemma-+-commutative a zero     = lemma-+-zero a
lemma-+-commutative a (succ b) = trans (lemma-+-succ a b)
                                       (cong succ (lemma-+-commutative a b))

-- EXERCISE: Verify that addition is associative.
lemma-+-associative : (a b c : ℕ) → (a + (b + c)) ≡ ((a + b) + c)
lemma-+-associative zero     b c = refl
lemma-+-associative (succ a) b c = cong succ (lemma-+-associative a b c)

-- EXERCISE: Verify the distributive law. Similar as the implementation/proof
-- of lemma-+-commutative, the result will not be easy to read.
-- By a technique called "equational reasoning", to be introduced next week,
-- we will be able to clean up the proof.
{-
Goal: (c + ((a + b) · c)) ≡ ((c + (a · c)) + (b · c))

lemma-distributive a b c: ((a + b) · c) ≡ ((a · c) + (b · c))
cong (c +_) (lemma-distributive a b c): (c + ((a + b) · c)) ≡ (c + ((a · c) + (b · c)))
lemma-+-associative c (a · c) (b · c): (c + ((a · c) + (b · c))) ≡ ((c + (a · c)) + (b · c))
-}
lemma-distributive : (a b c : ℕ) → ((a + b) · c) ≡ ((a · c) + (b · c))
lemma-distributive zero     b c = refl
lemma-distributive (succ a) b c = trans (cong (c +_) (lemma-distributive a b c))
                                        (lemma-+-associative c (a · c) (b · c))

-- EXERCISE: Show that the double of any number is even.
data Even : ℕ → Set where
  base-even : Even zero
  step-even : {n : ℕ} → Even n → Even (succ (succ n))

{-
Goal: Even (succ (a + succ a))

cong succ (lemma-+-commutative (succ a) a): succ (succ (a + a)) ≡ succ (a + succ a)
step-even (Even (a + a)): Even (succ (succ (a + a)))
lemma-double-even a: Even (a + a)
transport: Even → x ≡ y → Even x → Even y
-}
lemma-double-even : (a : ℕ) → Even (a + a)
lemma-double-even zero     = base-even
lemma-double-even (succ a) = transport (Even)
                                       (cong succ (lemma-+-commutative (succ a) a))
                                       (step-even (lemma-double-even a))


-------------------------------
----[ EQUALITIES OF LISTS ]----
-------------------------------

data List (A : Set) : Set where
  []  : List A
  _∷_ : A → List A → List A

module _ {A : Set} where
  -- the "snoc" operation ("backwards cons"),
  -- i.e. append an element at the end
  _∷ʳ_ : List A → A → List A
  []       ∷ʳ y = y ∷ []
  (x ∷ xs) ∷ʳ y = x ∷ (xs ∷ʳ y)

  -- for instance, "reverse (a ∷ b ∷ c ∷ [])" is "c ∷ b ∷ a ∷ []".
  reverse : List A → List A
  reverse []       = []
  reverse (x ∷ xs) = reverse xs ∷ʳ x

  -- EXERCISE: Verify the following lemma.
  lemma-reverse-∷ʳ : (xs : List A) (x : A) → reverse (xs ∷ʳ x) ≡ (x ∷ reverse xs)
  lemma-reverse-∷ʳ []       x = refl
  lemma-reverse-∷ʳ (y ∷ xs) x = cong (_∷ʳ y) (lemma-reverse-∷ʳ xs x)

  lemma-reverse-reverse : (xs : List A) → reverse (reverse xs) ≡ xs
  lemma-reverse-reverse []       = refl
  lemma-reverse-reverse (x ∷ xs) = trans (lemma-reverse-∷ʳ (reverse xs) x)
                                         (cong (x ∷_) (lemma-reverse-reverse xs))

  -- EXERCISE: State and prove that _++_ on lists is associative.
  _++_ : List A → List A → List A
  []       ++ ys = ys
  (x ∷ xs) ++ ys = x ∷ (xs ++ ys)

  lemma-++-associative : (xs ys zs : List A) → (xs ++ ys) ++ zs ≡ xs ++ (ys ++ zs)
  lemma-++-associative []       ys zs = refl
  lemma-++-associative (x ∷ xs) ys zs = cong (x ∷_) (lemma-++-associative xs ys zs)

  -- The following relation relates exactly those lists which have the same length
  -- and whose corresponding entries are equal.
  data _≈_ : List A → List A → Set where
    both-empty     : [] ≈ []
    both-same-cons : {xs ys : List A} {x y : A} → x ≡ y → xs ≈ ys → (x ∷ xs) ≈ (y ∷ ys)

  -- EXERCISE: Show that equal lists are related by _≈_.
  ≡→≈ : {xs ys : List A} → xs ≡ ys → xs ≈ ys
  ≡→≈ {[]}     refl = both-empty
  ≡→≈ {x ∷ xs} refl = both-same-cons refl (≡→≈ refl)

  -- EXERCISE: Show that related lists are equal.
  ≈→≡ : {xs ys : List A} → xs ≈ ys → xs ≡ ys
  ≈→≡ both-empty = refl
  ≈→≡ (both-same-cons refl p) with ≈→≡ p
  ...                            | refl = refl


---------------------------------
----[ EQUALITIES OF VECTORS ]----
---------------------------------

data Vector (A : Set) : ℕ → Set where
  []  : Vector A zero
  _∷_ : {n : ℕ} → A → Vector A n → Vector A (succ n)

module _ {A : Set} where
  drop : {n : ℕ} (k : ℕ) → Vector A (k + n) → Vector A n
  drop zero      xs        = xs
  drop (succ k') (x ∷ xs') = drop k' xs'

  take : {n : ℕ} (k : ℕ) → Vector A (k + n) → Vector A k
  take zero      xs        = []
  take (succ k') (x ∷ xs') = x ∷ take k' xs'

  _++ᵥ_ : {n m : ℕ} → Vector A n → Vector A m → Vector A (n + m)
  []        ++ᵥ ys = ys
  (x ∷ xs') ++ᵥ ys = x ∷ (xs' ++ᵥ ys)

  -- EXERCISE: Verify the following lemma.
  lemma-take-drop : {n : ℕ} (k : ℕ) → (xs : Vector A (k + n)) → (take k xs ++ᵥ drop k xs) ≡ xs
  lemma-take-drop zero     xs       = refl
  lemma-take-drop (succ k) (x ∷ xs) = cong (x ∷_) (lemma-take-drop k (xs))

  -- EXERCISE: Find out where the difficulty is in stating that _++ᵥ_ on
  -- vectors is associative.
  -- lemma-++ᵥ-associative : {a b c : ℕ} (xs : Vector A a) → (ys : Vector A b) → (zs : Vector A c) → (xs ++ᵥ ys) ++ᵥ zs ≡ xs ++ᵥ (ys ++ᵥ zs)
