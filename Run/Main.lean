import GoldBach.Core

def main : IO Unit := do
  IO.println s!"hasGoldbachPair 10 → {hasGoldbachPair 10}"
  IO.println s!"hasGoldbachPair 100 → {hasGoldbachPair 100}"
  IO.println s!"goldbach_4 is proven!"
