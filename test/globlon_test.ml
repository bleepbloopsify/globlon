let () =
  Globlon.glob ~glob_nocheck:true "asd" |> Array.iter print_endline;
  Globlon.globs ~glob_nocheck:true [| "asd"; "**"; "!*" |]
  |> Array.iter print_endline
