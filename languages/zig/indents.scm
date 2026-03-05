[
  ; (block)
  ; (switch_expression)
  ; (initializer_list)
  (if_statement)
  (for_statement)
  (while_statement)
  (else_clause)
] @indent

; (block
;   "}" @indent.end)

(_ "[" "]" @end) @indent
(_ "{" "}" @end) @indent
(_ "(" ")" @end) @indent
