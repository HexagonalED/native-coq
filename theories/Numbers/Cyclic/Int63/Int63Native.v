
(************************************************************************)
(*  v      *   The Coq Proof Assistant  /  The Coq Development Team     *)
(* <O___,, * CNRS-Ecole Polytechnique-INRIA Futurs-Universite Paris Sud *)
(*   \VV/  **************************************************************)
(*    //   *      This file is distributed under the terms of the       *)
(*         *       GNU Lesser General Public License Version 2.1        *)
(************************************************************************)
(*            Benjamin Gregoire, Laurent Thery, INRIA, 2007             *)
(************************************************************************)

Require Export DoubleType.

RegisterInd bool as ind_bool.
RegisterInd prod as ind_pair. 
RegisterInd carry as ind_carry.
RegisterInd comparison as ind_cmp.
RegisterInd eq as ind_eq.

Definition size := 63%nat.

Register int : Set as int63_type.

Delimit Scope int63_scope with int63.
Bind Scope int63_scope with int.

(* Logical operations *)
Register lsl  : int -> int -> int as int63_lsl.
Infix "<<" := lsl (at level 30, no associativity) : int63_scope.

Register lsr  : int -> int -> int as int63_lsr.
Infix ">>" := lsr (at level 30, no associativity) : int63_scope.

Register land : int -> int -> int as int63_land.
Infix "land" := land (at level 40, left associativity) : int63_scope.

Register lor  : int -> int -> int as int63_lor.
Infix "lor" := lor (at level 40, left associativity) : int63_scope.

Register lxor : int -> int -> int as int63_lxor.
Infix "lxor" := lxor (at level 40, left associativity) : int63_scope.

(* Arithmetic modulo operations *)
Register add : int -> int -> int as int63_add.
Notation "n + m" := (add n m) : int63_scope.

Register sub : int -> int -> int as int63_sub.
Notation "n - m" := (sub n m) : int63_scope.

Register mul : int -> int -> int as int63_mul.
Notation "n * m" := (mul n m) : int63_scope.

Register mulc : int -> int -> int * int as int63_mulc.

Register div : int -> int -> int as int63_div.
Notation "n / m" := (div n m) : int63_scope.

Register mod : int -> int -> int as int63_mod.
Notation "n '\%' m" := (mod n m) (at level 40, left associativity) : int63_scope.

(* Comparisons *)
Register eqb : int -> int -> bool as int63_eq.
Notation "m '==' n" := (eqb m n) (at level 70, no associativity) : int63_scope.

Register ltb : int -> int -> bool as int63_lt.
Notation "m < n" := (ltb m n) : int63_scope.

Register leb : int -> int -> bool as int63_le.
Notation "m <= n" := (leb m n) : int63_scope.

(* This operator has the following reduction rule
     eqb_correct i i (eq_refl true) ---> (eq_refl i) *)
Register eqb_correct : forall i j, (i==j)%int63 = true -> i = j as int63_eqb_correct.

(* Iterators *)
Register foldi_right :
  forall 
     {A       : Type}
     (f       : int -> A -> A ) 
     (from to : int),
     A -> A
     as int63_foldi.

(*Definition foldi_cont {A B : type} 
     (f       : int -> (A -> B) -> A -> B) 
     (from to : int)
     (cont    : A -> B), 
     (a:A) : B := 
  if i 
  foldi_right f from to (f to) 
     as int63_foldi. *)

Register foldi_down_right : 
  forall 
    {A           : Type}
    (f           : int -> A -> A)
    (from downto : int),
    A -> A
    as int63_foldi_down.

(* Print *)

Register print_int : int -> int as int63_print.



