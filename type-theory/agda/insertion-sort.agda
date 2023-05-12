data _⨄_ (X Y : Set) : Set where
  left  : X → X ⨄ Y
  right : Y → X ⨄ Y

module _
  (A : Set)
  (_≤_ : A → A → Set)
  (cmp? : (x y : A) → ((x ≤ y) ⨄ (y ≤ x)))
  (-∞ : A)
  where
 
  data List : Set where
    []  : List
    _∷_ : A → List → List

  -- No guarantee that List is sorted
  insert-sorted' : A → List → List
  insert-sorted' x []       = x ∷ []
  insert-sorted' x (y ∷ xs) with cmp? x y
  ... | left  x≤y = x ∷ (y ∷ xs)
  ... | right y≤x = y ∷ insert-sorted' x xs

  insertion-sort' : List → List
  insertion-sort' []       = []
  insertion-sort' (x ∷ xs) = insert-sorted' x (insertion-sort' xs)

  data AscSortList : A → Set where
    []     : AscSortList -∞
    x      : {x : A} → AscSortList x
    _∷[_]_ : {y : A} (x : A) → (x ≤ y) → AscSortList y → AscSortList x

  insert-sorted : {y z : A} (x : A) → AscSortList y → AscSortList z
  insert-sorted = {!!}

  insertion-sort : {x : A} → List → AscSortList x
  insertion-sort {-∞} []       = []
  insertion-sort (x ∷ xs) = insert-sorted x (insertion-sort xs)
