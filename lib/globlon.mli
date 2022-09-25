(** https://man7.org/linux/man-pages/man3/glob.3.html

  The argument flags is made up of the bitwise OR of zero or more of the following symbolic constants, which modify the behavior of glob():

  GLOB_ERR
    Return upon a read error (because a directory does not
    have read permission, for example).  By default, glob()
    attempts carry on despite errors, reading all of the
    directories that it can.

  GLOB_MARK
    Append a slash to each path which corresponds to a
    directory.

  GLOB_NOSORT
    Don't sort the returned pathnames.  The only reason to do
    this is to save processing time.  By default, the returned
    pathnames are sorted.

  GLOB_DOOFFS
    Reserve pglob->gl_offs slots at the beginning of the list
    of strings in pglob->pathv.  The reserved slots contain
    null pointers.

  GLOB_NOCHECK
    If no pattern matches, return the original pattern.  By
    default, glob() returns GLOB_NOMATCH if there are no
    matches.

  GLOB_APPEND
    Append the results of this call to the vector of results
    returned by a previous call to glob().  Do not set this
    flag on the first invocation of glob().

  GLOB_NOESCAPE
    Don't allow backslash ('\') to be used as an escape
    character.  Normally, a backslash can be used to quote the
    following character, providing a mechanism to turn off the
    special meaning metacharacters.

  flags may also include any of the following, which are GNU
  extensions and not defined by POSIX.2:

  GLOB_PERIOD
    Allow a leading period to be matched by metacharacters.
    By default, metacharacters can't match a leading period.

  GLOB_ALTDIRFUNC
    Use alternative functions pglob->gl_closedir,
    pglob->gl_readdir, pglob->gl_opendir, pglob->gl_lstat, and
    pglob->gl_stat for filesystem access instead of the normal
    library functions.

  GLOB_BRACE
    Expand csh(1) style brace expressions of the form {a,b}.
    Brace expressions can be nested.  Thus, for example,
    specifying the pattern "{foo/{,cat,dog},bar}" would return
    the same results as four separate glob() calls using the
    strings: "foo/", "foo/cat", "foo/dog", and "bar".

  GLOB_NOMAGIC
    If the pattern contains no metacharacters, then it should
    be returned as the sole matching word, even if there is no
    file with that name.

  GLOB_TILDE
    Carry out tilde expansion.  If a tilde ('~') is the only
    character in the pattern, or an initial tilde is followed
    immediately by a slash ('/'), then the home directory of
    the caller is substituted for the tilde.  If an initial
    tilde is followed by a username (e.g., "~andrea/bin"),
    then the tilde and username are substituted by the home
    directory of that user.  If the username is invalid, or
    the home directory cannot be determined, then no
    substitution is performed.

  GLOB_TILDE_CHECK
    This provides behavior similar to that of GLOB_TILDE.  The
    difference is that if the username is invalid, or the home
    directory cannot be determined, then instead of using the
    pattern itself as the name, glob() returns GLOB_NOMATCH to
    indicate an error.

  GLOB_ONLYDIR
    This is a hint to glob() that the caller is interested
    only in directories that match the pattern.  If the
    implementation can easily determine file-type information,
    then nondirectory files are not returned to the caller.
    However, the caller must still check that returned files
    are directories.  (The purpose of this flag is merely to
    optimize performance when the caller is interested only in
    directories.)
*)

val glob :
  ?glob_err:bool ->
  ?glob_mark:bool ->
  ?glob_nosort:bool ->
  ?glob_nocheck:bool ->
  ?glob_noescape:bool ->
  ?glob_period:bool ->
  ?glob_altdirfunc:bool ->
  ?glob_nomagic:bool ->
  ?glob_brace:bool ->
  ?glob_tilde:bool ->
  ?glob_onlydir:bool ->
  string ->
  string array
(** [glob ?[...flags] pattern] checks [pattern] for matches using [flags] *)

val globs :
  ?glob_err:bool ->
  ?glob_mark:bool ->
  ?glob_nosort:bool ->
  ?glob_nocheck:bool ->
  ?glob_noescape:bool ->
  ?glob_period:bool ->
  ?glob_altdirfunc:bool ->
  ?glob_nomagic:bool ->
  ?glob_brace:bool ->
  ?glob_tilde:bool ->
  ?glob_onlydir:bool ->
  string array ->
  string array
(** [globs ?[...flags] patterns] checks [patterns] for matches using [flags] *)
