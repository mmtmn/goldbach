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

#eval hasGoldbachPair 10    -- should return true
#eval hasGoldbachPair 100   -- should return true
#eval hasGoldbachPair 7776  -- try whatever even number you like

lemma goldbach_4 : ∃ p₁ p₂, Nat.Prime p₁ ∧ Nat.Prime p₂ ∧ p₁ + p₂ = 4 := by
  use 2, 2
  constructor
  · exact Nat.prime_two
  constructor
  · exact Nat.prime_two
  · norm_num
