data _⨄_ (X Y : Set) : Set where
  left  : X → X ⨄ Y
  right : Y → X ⨄ Y

module _
  (A : Set)
  (_≤_ : A → A → Set)
  (cmp? : (x y : A) → ((x ≤ y) ⨄ (y ≤ x)))
  where
 
  infixr 5 _∷_
  data List : Set where
    []  : List
    _∷_ : A → List → List

  -- No guarantee that List is sorted
  insert-sorted' : A → List → List
  insert-sorted' x []       = x ∷ []
  insert-sorted' x (y ∷ xs) with cmp? x y
  ... | left  x≤y = x ∷ y ∷ xs
  ... | right y≤x = y ∷ insert-sorted' x xs

  insertion-sort' : List → List
  insertion-sort' []       = []
  insertion-sort' (x ∷ xs) = insert-sorted' x (insertion-sort' xs)

  data Sorted : List → Set where
    []  : Sorted []
    [-] : {x : A} → Sorted (x ∷ [])
    _∷_ : {x y : A} {xs : List} → y ≤ x → Sorted (x ∷ xs) → Sorted (y ∷ x ∷ xs)
