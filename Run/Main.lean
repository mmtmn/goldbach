import GoldBach.Core

def main : IO Unit := do
  IO.println s!"hasGoldbachPair 10 → {hasGoldbachPair 10}"
  IO.println s!"hasGoldbachPair 100 → {hasGoldbachPair 100}"
  IO.println s!"goldbach_4 is proven!"
  IO.println "Scanning for Goldbach failures up to 100..."
  let failures := goldbachFailuresUpTo 100
  if failures.isEmpty then
    IO.println "No failures detected."
  else
    IO.println s!"Failures: {failures}"
  IO.println "Sample Goldbach pair counts (even n from 4 to 100):"
  for n in List.range 101 do
    if Even n ∧ n > 2 then
      IO.println s!"n = {n}, pairs = {goldbachCandidatePairCount n}"
