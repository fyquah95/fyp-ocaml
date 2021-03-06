[@@@ocaml.warning "+a-4-9-30-40-41-42"]

let main() =
  let filename = Sys.argv.(1) in
  let ic = open_in filename in
  let ts = Data_collector.V0.load_from_channel ic in
  let ppf = Format.formatter_of_out_channel stdout in
  List.iter (fun t ->

      if t.Data_collector.V0.decision then begin
        Format.fprintf ppf "=> YES - "
      end else begin
        Format.fprintf ppf "=> NO  - "
      end;

      Format.fprintf ppf "[%a] -- " Closure_id.print t.applied;
      Format.pp_print_list ~pp_sep:(fun ppf () -> Format.fprintf ppf " -- ")
        (fun ppf a -> Format.fprintf ppf "%a" Call_site.pprint a)
        ppf t.call_stack;
      Format.fprintf ppf "\n")
    ts
;;

let _ = main ()
