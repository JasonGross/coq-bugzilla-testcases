(*In 8.5pl1 (088b316):*)

Variables P Q : nat -> Prop.
Variable f : nat -> nat.

Goal forall (x:nat), (forall y, P y -> forall z, Q z -> y=f z -> False) -> False. intros.
ecase H with (3:=eq_refl).
(*
produces "Anomaly: Evar ?X10 was not declared. Please report." *)
Abort.

(*

Another variation:
*)
Goal forall (x:nat), (forall y, y=x -> False) -> False.
intros.
unshelve ecase H with (1:=eq_refl).
Qed.
(*
produces 2 unsolved goals;

2 subgoals
x : nat
H : forall y : nat, y = x -> False
______________________________________(1/2)
Type
______________________________________(2/2)
?A


apparently from eq_refl, even though it must have had its type inferred to @eq nat y x. *)
