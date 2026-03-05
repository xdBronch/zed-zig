(test_declaration
  "test" @context
  [
   (string)
   (identifier)
   ] @name) @item

(function_declaration
  "pub"? @context
  [
    "extern"
    "export"
    "inline"
    "noinline"
  ]? @context
  "fn" @context
  name: (_) @name) @item

; (source_file
;   (variable_declaration
;     "pub"? @context
;     (identifier) @name
;     "=" (_) @context) @item)

; (variable_declaration
;   "pub"? @context
;   (identifier) @name
;   (struct_declaration
;     (["packed" "extern"]? "struct") @context)) @item

(variable_declaration
  "pub"? @context
  ["const" "var"] @context
  (identifier) @name
  "=" @context
  (union_declaration "union" @context)) @item

(variable_declaration
  "pub"? @context
  ["const" "var"] @context
  (identifier) @name
  "=" @context
  (struct_declaration "struct" @context)) @item

(variable_declaration
  "pub"? @context
  ["const" "var"] @context
  (identifier) @name
  "=" @context
  (enum_declaration "enum" @context)) @item

(variable_declaration
  "pub"? @context
  ["const" "var"] @context
  (identifier) @name
  "=" @context
  (error_set_declaration "error" @context)) @item

(variable_declaration
  "pub"? @context
  ["const" "var"] @context
  (identifier) @name
  "=" @context
  (opaque_declaration "opaque" @context)) @item

(container_field
  name: (_) @name) @item

(enum_union_field
  name: (_) @name) @item
