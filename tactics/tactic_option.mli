(************************************************************************)
(*  v      *   The Coq Proof Assistant  /  The Coq Development Team     *)
(* <O___,, * CNRS-Ecole Polytechnique-INRIA Futurs-Universite Paris Sud *)
(*   \VV/  **************************************************************)
(*    //   *      This file is distributed under the terms of the       *)
(*         *       GNU Lesser General Public License Version 2.1        *)
(************************************************************************)

open Proof_type
open Tacexpr
open Vernacexpr

val declare_tactic_option : string -> 
  (* put *) (locality_flag -> glob_tactic_expr -> unit) *
  (* get *) (unit -> locality_flag * tactic) *
  (* print *) (unit -> Pp.std_ppcmds)
