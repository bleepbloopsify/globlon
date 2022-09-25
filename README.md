# Globlon - a globbing library for ocaml

This library allows you to use unix shell style globbing to match against paths.

We use Foreign Function Interface (FFI) to call `glob(3)`, and provide access to all of their flags.
