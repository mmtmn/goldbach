import Mathlib.Data.Nat.Prime.Basic
import Mathlib.Data.Nat.Basic
import Mathlib.Tactic

open Nat

def failsGoldbach (n : ℕ) : Prop :=
  n > 2 ∧ Even n ∧ ∀ p : ℕ, p < n → Nat.Prime p → ¬ Nat.Prime (n - p)

def goldbachConjecture : Prop :=
  ∀ n : ℕ, n > 2 → Even n → ¬ failsGoldbach n

def isPrime (n : ℕ) : Bool :=
  if n < 2 then false
  else !(List.range (n - 2)).any (λ d => n % (d + 2) == 0)

def hasGoldbachPair (n : ℕ) : Bool :=
  List.range n |>.any (λ p => isPrime p ∧ isPrime (n - p))

def goldbachCandidatePairCount (n : ℕ) : Nat :=
  List.length (List.filter (λ p => isPrime p ∧ isPrime (n - p)) (List.range n))

def goldbachFailuresUpTo (limit : ℕ) : List ℕ :=
  (List.range (limit + 1)).filter (λ n =>
    Even n ∧ n > 2 ∧ ¬ hasGoldbachPair n)

lemma goldbach_4 : ∃ p₁ p₂, Nat.Prime p₁ ∧ Nat.Prime p₂ ∧ p₁ + p₂ = 4 := by
  use 2, 2
  constructor
  · exact Nat.prime_two
  constructor
  · exact Nat.prime_two
  · norm_num
