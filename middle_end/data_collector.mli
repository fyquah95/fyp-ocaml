[@@@ocaml.warning "+a-4-9-30-40-41-42"]

type t =
  { call_stack : Call_site.t list;
    applied : Closure_id.t;
    decision : bool;
  }

val inlining_decisions : t list ref

val inlining_overrides : t list ref

val save : output_prefix: string -> unit

val print_list : Format.formatter -> t list -> unit

val parse : string list -> t list