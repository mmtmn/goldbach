import Lake
open Lake DSL

package goldbach

@[default_target]
lean_lib GoldBach {
  srcDir := "."
}

@[default_target]
lean_exe goldbachRun where
  root := `Run.Main

require mathlib from git
  "https://github.com/leanprover-community/mathlib4" @ "master"
