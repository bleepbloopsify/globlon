#include <glob.h>

#define CAML_NAME_SPACE
#include <caml/alloc.h>
#include <caml/fail.h>
#include <caml/memory.h>
#include <caml/mlvalues.h>

CAMLprim value glob_err() {
  CAMLparam0();
  CAMLreturn(Val_int(GLOB_ERR));
}
CAMLprim value glob_mark() {
  CAMLparam0();
  CAMLreturn(Val_int(GLOB_MARK));
}
CAMLprim value glob_nosort() {
  CAMLparam0();
  CAMLreturn(Val_int(GLOB_NOSORT));
}
CAMLprim value glob_nocheck() {
  CAMLparam0();
  CAMLreturn(Val_int(GLOB_NOCHECK));
}
CAMLprim value glob_noescape() {
  CAMLparam0();
  CAMLreturn(Val_int(GLOB_NOESCAPE));
}
CAMLprim value glob_period() {
  CAMLparam0();
#ifdef GLOB_PERIOD
  CAMLreturn(Val_int(GLOB_PERIOD));
#else
  caml_failwith("GLOB_PERIOD not supported");
#endif
}
CAMLprim value glob_altdirfunc() {
  CAMLparam0();
#ifdef GLOB_ALTDIRFUNC
  CAMLreturn(Val_int(GLOB_ALTDIRFUNC));
#else
  caml_failwith("GLOB_ALTDIRFUNC not supported");
#endif
}
CAMLprim value glob_nomagic() {
  CAMLparam0();
#ifdef GLOB_NOMAGIC
  CAMLreturn(Val_int(GLOB_NOMAGIC));
#else
  caml_failwith("GLOB_NOMAGIC not supported");
#endif
}
CAMLprim value glob_brace() {
  CAMLparam0();
#ifdef GLOB_BRACE
  CAMLreturn(Val_int(GLOB_BRACE));
#else
  caml_failwith("GLOB_BRACE not supported");
#endif
}
CAMLprim value glob_tilde() {
  CAMLparam0();
#ifdef GLOB_TILDE
  CAMLreturn(Val_int(GLOB_TILDE));
#else
  caml_failwith("GLOB_TILDE not supported");
#endif
}
CAMLprim value glob_onlydir() {
  CAMLparam0();
#ifdef GLOB_ONLYDIR
  CAMLreturn(Val_int(GLOB_ONLYDIR));
#else
  caml_failwith("GLOB_ONLYDIR not supported");
#endif
}

void handleErrors(int r, glob_t *gl) {
  // if we have an error, we should free allocated memory before raising
  if (r != 0) {
    globfree(gl);
  }
  if (r == GLOB_NOMATCH) {
    caml_failwith("glob: no found matches");
  }
  if (r == GLOB_ABORTED) {
    caml_failwith("glob: read error");
  }
  if (r == GLOB_NOSPACE) {
    caml_failwith("glob: memory allocation error");
  }
  if (r != 0) {
    caml_failwith("glob: unknown error");
  }
}

CAMLprim value ocaml_glob(value pattern, value flags) {
  CAMLparam2(pattern, flags);
  CAMLlocal1(matches);

  glob_t gl;

  int r = glob(String_val(pattern), Int_val(flags), NULL, &gl);
  handleErrors(r, &gl);

  matches = caml_alloc(gl.gl_pathc, 0);
  for (int i = 0; i < gl.gl_pathc; i++) {
    Store_field(matches, i, caml_copy_string(gl.gl_pathv[i]));
  }

  globfree(&gl);
  CAMLreturn(matches);
}

CAMLprim value ocaml_globs(value patterns, value passed_flags) {
  CAMLparam2(patterns, passed_flags);
  CAMLlocal1(matches);

  glob_t gl;
  int flags = Int_val(passed_flags);

  for (int i = 0; i < Wosize_val(patterns); i++) {
    int r = glob(String_val(Field(patterns, i)), flags, NULL, &gl);
    handleErrors(r, &gl);
    flags |= GLOB_APPEND;
  }

  matches = caml_alloc(gl.gl_pathc, 0);
  for (int i = 0; i < gl.gl_pathc; i++) {
    Store_field(matches, i, caml_copy_string(gl.gl_pathv[i]));
  }

  globfree(&gl);
  CAMLreturn(matches);
}