let calculate_flags ?(glob_err = false) ?(glob_mark = false)
    ?(glob_nosort = false) ?(glob_nocheck = false) ?(glob_noescape = false)
    ?(glob_period = false) ?(glob_altdirfunc = false) ?(glob_nomagic = false)
    ?(glob_brace = false) ?(glob_tilde = false) ?(glob_onlydir = false) () =
  let flags = 0 in
  let flags = if glob_err then flags lor Glob.glob_err () else flags in
  let flags = if glob_mark then flags lor Glob.glob_mark () else flags in
  let flags = if glob_nosort then flags lor Glob.glob_nosort () else flags in
  let flags = if glob_nocheck then flags lor Glob.glob_nocheck () else flags in
  let flags =
    if glob_noescape then flags lor Glob.glob_noescape () else flags
  in
  let flags = if glob_period then flags lor Glob.glob_period () else flags in
  let flags =
    if glob_altdirfunc then flags lor Glob.glob_altdirfunc () else flags
  in
  let flags = if glob_nomagic then flags lor Glob.glob_nomagic () else flags in
  let flags = if glob_brace then flags lor Glob.glob_brace () else flags in
  let flags = if glob_tilde then flags lor Glob.glob_tilde () else flags in
  let flags = if glob_onlydir then flags lor Glob.glob_onlydir () else flags in
  flags

let glob ?glob_err ?glob_mark ?glob_nosort ?glob_nocheck ?glob_noescape
    ?glob_period ?glob_altdirfunc ?glob_nomagic ?glob_brace ?glob_tilde
    ?glob_onlydir pattern =
  let flags =
    calculate_flags ?glob_err ?glob_mark ?glob_nosort ?glob_nocheck
      ?glob_noescape ?glob_period ?glob_altdirfunc ?glob_nomagic ?glob_brace
      ?glob_tilde ?glob_onlydir ()
  in
  Glob.glob pattern flags

let globs ?glob_err ?glob_mark ?glob_nosort ?glob_nocheck ?glob_noescape
    ?glob_period ?glob_altdirfunc ?glob_nomagic ?glob_brace ?glob_tilde
    ?glob_onlydir patterns =
  let flags =
    calculate_flags ?glob_err ?glob_mark ?glob_nosort ?glob_nocheck
      ?glob_noescape ?glob_period ?glob_altdirfunc ?glob_nomagic ?glob_brace
      ?glob_tilde ?glob_onlydir ()
  in
  Glob.globs patterns flags
