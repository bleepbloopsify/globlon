external glob_err : unit -> int = "glob_err"
(** [glob_err ()] returns the value of [GLOB_ERR] for the system *)

external glob_mark : unit -> int = "glob_mark"
(** [glob_mark ()] returns the value of [GLOB_MARK] for the system *)

external glob_nosort : unit -> int = "glob_nosort"
(** [glob_nosort ()] returns the value of [GLOB_NOSORT] for the system *)

external glob_nocheck : unit -> int = "glob_nocheck"
(** [glob_nocheck ()] returns the value of [GLOB_NOCHECK] for the system *)

external glob_noescape : unit -> int = "glob_noescape"
(** [glob_noescape ()] returns the value of [GLOB_NOESCAPE] for the system *)

external glob_period : unit -> int = "glob_period"
(** [glob_period ()] returns the value of [GLOB_PERIOD] for the system, and throws an exception if it is unsupported *)

external glob_altdirfunc : unit -> int = "glob_altdirfunc"
(** [glob_altdirfunc ()] returns the value of [GLOB_ALTDIRFUNC] for the system, and throws an exception if it is unsupported *)

external glob_nomagic : unit -> int = "glob_nomagic"
(** [glob_nomagic ()] returns the value of [GLOB_NOMAGIC] for the system, and throws an exception if it is unsupported *)

external glob_brace : unit -> int = "glob_brace"
(** [glob_brace ()] returns the value of [GLOB_BRACE] for the system, and throws an exception if it is unsupported *)

external glob_tilde : unit -> int = "glob_tilde"
(** [glob_tilde ()] returns the value of [GLOB_TILDE] for the system, and throws an exception if it is unsupported *)

external glob_onlydir : unit -> int = "glob_onlydir"
(** [glob_onlydir ()] returns the value of [GLOB_ONLYDIR] for the system, and throws an exception if it is unsuported *)

external glob : string -> int -> string array = "ocaml_glob"
(** [glob pattern flags] returns the list of files matching [pattern] with the given [flags] *)

external globs : string array -> int -> string array = "ocaml_globs"
(** [globs patterns flags] returns the list of files matching any of the [patterns] with the given [flags] *)
