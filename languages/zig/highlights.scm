; Variables

(identifier) @variable

; Parameters

(parameter
  name: (identifier) @variable.parameter)

; Types

(parameter
  type: (identifier) @type)

((identifier) @type
  (#match? @type "^[A-Z][a-zA-Z0-9_]*"))

(variable_declaration
  (identifier) @type
  "="
  [
    (struct_declaration)
    (enum_declaration)
    (union_declaration)
    (opaque_declaration)
  ])

[
  (builtin_type)
  "anyframe"
] @type.builtin

; Constants

[
  "null"
  "unreachable"
  "undefined"
] @constant.builtin

(field_expression
  .
  member: (identifier) @property)

; (enum_declaration
;   (enum_union_field
;     name: (_) @constant))

; Labels

(block_label (identifier) @label)

(break_label (identifier) @label)

; Fields

(field_initializer
  .
  (identifier) @variable.member)

(field_expression
  (_)
  member: (identifier) @property)

(container_field
  name: (_)? @property
  type: (_) @type)

(enum_union_field
  name: (identifier) @property
  type: (_)? @type)

(initializer_list
  (assignment_expression
      left: (field_expression
              .
              member: (identifier) @property)))

; Functions

(builtin_identifier) @function.builtin

(call_expression
  function: (identifier) @function.call)

(call_expression
  function: (field_expression
    member: (identifier) @function.call))

(function_declaration
  name: (identifier) @function)

(function_declaration
  name: (identifier) @type
  type: (_) @type.return
  (#eq? @type.return "type"))
  ; (#match? @type "^[A-Z][a-zA-Z0-9_]*"))

(call_expression
  function: (identifier) @type
  (#match? @type "^[A-Z][a-zA-Z0-9_]*"))

(field_expression
  (_)
  member: (identifier) @type (#match? @type "^[A-Z][a-zA-Z0-9_]*"))
; Modules

; Builtins

[
  "c"
  "..."
] @variable.builtin

((identifier) @variable.builtin
  (#eq? @variable.builtin "_"))

(calling_convention
  (identifier) @variable.builtin)

; Keywords

[
  "asm"
  "defer"
  "errdefer"
  "test"
  "error"
  "const"
  "var"
  "struct"
  "union"
  "enum"
  "opaque"
  "suspend"
  "nosuspend"
  "resume"
  "and"
  "or"
  "orelse"
  "if"
  "else"
  "switch"
  "for"
  "while"
  "break"
  "continue"
  "usingnamespace"
  "export"
  "try"
  "catch"
  "volatile"
  "allowzero"
  "noalias"
  "addrspace"
  "align"
  "callconv"
  "linksection"
  "pub"
  "inline"
  "noinline"
  "extern"
  "comptime"
  "packed"
  "threadlocal"
  "fn"
  "return"
] @keyword

; [
; ] @keyword.type
;
; [
; ] @keyword.coroutine
;
; "fn" @keyword.function
;
; [
; ] @keyword.operator
;
; "return" @keyword.return
;
; [
; ] @keyword.conditional
;
; [
; ] @keyword.repeat
;
; [
; ] @keyword.import
;
; [
; ] @keyword.exception
;
; [
; ] @keyword.modifier

; Operator

[
  "="
  "*="
  "*%="
  "*|="
  "/="
  "%="
  "+="
  "+%="
  "+|="
  "-="
  "-%="
  "-|="
  "<<="
  "<<|="
  ">>="
  "&="
  "^="
  "|="
  "!"
  "~"
  "-"
  "-%"
  "&"
  "=="
  "!="
  ">"
  ">="
  "<="
  "<"
  "&"
  "^"
  "|"
  "<<"
  ">>"
  "<<|"
  "+"
  "++"
  "+%"
  "-%"
  "+|"
  "-|"
  "*"
  "/"
  "%"
  "**"
  "*%"
  "*|"
  "||"
  ".*"
  ".?"
  "?"
  ".."
  "..."
  "=>"
  "->"
] @operator

; Literals

(character) @string

([
  (string)
  (multiline_string)
] @string)

(integer) @number

(float) @number.float

(boolean) @boolean

(escape_sequence) @string.escape

; Punctuation

[
  "["
  "]"
  "("
  ")"
  "{"
  "}"
] @punctuation.bracket

[
  ";"
  "."
  ","
  ":"
] @punctuation.delimiter

; (payload "|" @punctuation.bracket)

; Comments

(comment) @comment

; ((comment) @comment.documentation
;   (#match? @comment.documentation "^//(/|!)"))

(ERROR) @constant
(ERROR) @constructor
(ERROR) @function.method
(ERROR) @snippet
(ERROR) @method
